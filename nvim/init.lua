local is_wsl = function()
    local output = vim.fn.systemlist('uname -r')
    return not not string.find(output[1] or '', 'WSL')
end

local running_in_wsl = is_wsl()
vim.g.dotfiles_is_wsl = running_in_wsl

if vim.g.neovide then
	if vim.g.dotfiles_is_wsl then
		vim.o.guifont = "Comic Code:h10"
		vim.g.neovide_title_background_color = "#1F1F28"
	else
		vim.o.guifont = "Comic Code:h12"
		-- vim.o.guifont = "Operator Mono Lig:h14"
	end
	vim.g.neovide_cursor_vfx_mode = "pixiedust"

	-- https://neovide.dev/configuration.html#hiding-the-mouse-when-typing
	vim.g.neovide_hide_mouse_when_typing = true

	vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

	-- 修复 neovide 启动后颜色不正确, 进入 UI 后再设置一次颜色方案
	vim.api.nvim_create_autocmd("UIEnter", {
		once = true,
		callback = function()
			vim.schedule(function()
				vim.cmd.colorscheme("kanagawa-wave")
			end)
		end,
	})
end

-- leader key
vim.g.mapleader=" "
vim.g.maplocalleader='\\'

vim.g.have_nerd_font = true

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.splitright=true

vim.o.cursorline=true

-- 标志栏
vim.o.signcolumn='yes'

vim.o.number=false

-- 系统粘贴板
vim.o.clipboard=vim.o.clipboard .. "unnamedplus"

vim.o.showmode = false

-- true color
vim.o.termguicolors=true

-- help disable-mouse
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

-- 显示不可见字符格式，set list打开，set nolist关闭
vim.opt.listchars = {
	eol = '$',
	tab = '│─',
	trail = '·',
	extends = '⟩',
	precedes = '⟨',
	nbsp = '␣',
}
vim.opt.shortmess:append("I")

-- vim.o.hlsearch=true    -- 高亮搜索
-- vim.o.incsearch=true   -- 实时匹配
vim.o.ignorecase=true  -- 忽略大小写

vim.g.completion = "blink"
-- vim.g.completion = "nvim-cmp"
vim.g.copilot_engine="copilot.lua"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- wsl
-- https://neovim.io/doc/user/provider.html#clipboard-wsl
if running_in_wsl then
	vim.g.clipboard = {
		name = 'WslClipboard',
		copy = {
			['+'] = 'clip.exe',
			['*'] = 'clip.exe',
		},
		paste = {
			['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

require("lazy").setup("plugins", {
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				-- "tarPlugin",
				"tohtml",
				"tutor",
				-- "zipPlugin",
			},
		},
	},
	change_detection = {
		notify = false,
	},
})

vim.cmd.colorscheme('kanagawa-wave')

local capabilities
if vim.g.completion == "blink" then
	capabilities = require('blink.cmp').get_lsp_capabilities()
elseif vim.g.completion == "nvim-cmp" then
	capabilities = require('cmp_nvim_lsp').default_capabilities()
end

-------------------------------------------------------- LSP Server Configuration
vim.lsp.config('*', {
	capabilities = capabilities,
})

local lsp_servers = {}
local function lsp_config(name, config)
	lsp_servers[name] = true
	vim.lsp.config(name, config)
end

lsp_config("clangd", {
	on_attach = function(client)
		-- Ref: help vim.lsp.semantic_tokens.start
		client.server_capabilities.semanticTokensProvider = nil
	end,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})


lsp_config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- enable = false,
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				-- library = { require("neodev.config").types() },
				-- FIXME: https://github.com/LuaLS/lua-language-server/discussions/1688
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

local function lsp_toggle()
	local filetype = vim.bo.filetype
	local matching = vim
		.iter(vim.tbl_keys(lsp_servers))
		:filter(function(name)
			local config = vim.lsp.config[name]
			return config.filetypes and vim.list_contains(config.filetypes, filetype)
		end)
		:totable()

	if #matching == 0 then
		vim.notify("No configured LSP for filetype: " .. filetype, vim.log.levels.WARN)
		return
	end

	local enabled = vim.iter(matching):filter(vim.lsp.is_enabled):totable()
	if #enabled > 0 then
		vim.lsp.enable(enabled, false)
		vim.notify("LSP disabled: " .. table.concat(enabled, ", "))
		return
	end

	local function enable(name)
		if name then
			vim.lsp.enable(name)
			vim.notify("LSP enabled: " .. name)
		end
	end

	if #matching == 1 then
		enable(matching[1])
	else
		vim.ui.select(matching, { prompt = "Enable LSP:" }, enable)
	end
end

vim.api.nvim_create_user_command("LspToggle", lsp_toggle, {
	desc = "Toggle the configured LSP for the current filetype",
})
vim.keymap.set("n", "<leader>ll", lsp_toggle, { desc = "[LSP] toggle for current filetype" })
