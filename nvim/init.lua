local is_wsl = function()
    local output = vim.fn.systemlist('uname -r')
    return not not string.find(output[1] or '', 'WSL')
end

if is_wsl() then
	vim.g.dotfiles_is_wsl = true
else
	vim.g.dotfiles_is_wsl = false
end

if vim.g.neovide then
	if vim.g.dotfiles_is_wsl then
		vim.o.guifont = "Comic Code:h10"
		vim.g.neovide_title_background_color = string.format(
			"%x",
			vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
		)
	else
		vim.o.guifont = "Comic Code:h12"
		-- vim.o.guifont = "Operator Mono Lig:h14"
	end
	vim.g.neovide_cursor_vfx_mode = "pixiedust"

	-- https://neovide.dev/configuration.html#hiding-the-mouse-when-typing
	vim.g.neovide_hide_mouse_when_typing = true

	vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- leader key
vim.g.mapleader=" "
vim.g.maplocalleader=','

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

-- vim.o.hlsearch=true    -- 高亮搜索
-- vim.o.incsearch=true   -- 实时匹配
vim.o.ignorecase=true  -- 忽略大小写

vim.g.completion = "blink"
vim.g.copilot_engine="copilot.lua"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
if is_wsl() then
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

vim.cmd.colorscheme('kanagawa')


-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local lsp_capabilities=vim.lsp.protocol.make_client_capabilities()
lsp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}


if vim.g.completion == "blink" then
    capabilities = require('blink.cmp').get_lsp_capabilities()
elseif vim.g.completion == "nvim-cmp" then
    capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)
end

-------------------------------------------------------- LSP Server Configuration
vim.lsp.enable({'clangd', 'lua_ls', 'vimls', 'bashls', 'pyright', 'neocmake', 'perlnavigator'}, false)

vim.lsp.config("clangd", {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
	settings = {
		clangd = {
			semanticHighlighting = true,
		},
	},
})


vim.lsp.config("lua_ls", {
	capabilities = capabilities,
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

vim.lsp.config("vimls", {
	capabilities = capabilities,
})

vim.lsp.config("bashls", {
	capabilities = capabilities,
})

vim.lsp.config("pyright", {
	capabilities = capabilities,
})

vim.lsp.config("neocmake", {
	capabilities = capabilities,
})

vim.lsp.config("perlnavigator", {
	capabilities = capabilities,
})
