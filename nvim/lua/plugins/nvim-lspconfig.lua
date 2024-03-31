-- local opts = { noremap=true, silent=true }
local function map(mode, l, r, opts)
	opts = opts or {}
	opts.noremap = true
	opts.silent = true
	vim.keymap.set(mode, l, r, opts)
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neoconf.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
--[[
			local lspconfig = require'lspconfig'
			lspconfig.util.default_config = vim.tbl_extend(
				"force",
				lspconfig.util.default_config,
				{
					autostart = false,
				}
			)
]]
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--[[
			vim.diagnostic.disable()
			local diagnostics_active = false
			map('n', '<leader>ldt', function()
				diagnostics_active = not diagnostics_active
				if diagnostics_active then
					vim.diagnostic.enable()
				else
					vim.diagnostic.disable()
					-- vim.diagnostic.disable()
				end
			end, {desc = "[LSP] toggle diagnostic"})
]]

			-- Mappings.
			map('n', '<leader>ldd', vim.diagnostic.open_float, { desc = "[LSP] diagnostic detail on float" })
			map('n', '[d', vim.diagnostic.goto_prev, { desc = "[LSP] prev diagnostic" })
			map('n', ']d', vim.diagnostic.goto_next, { desc = "[LSP] next diagnostic" })
			map('n', '<leader>ldp', vim.diagnostic.goto_prev, { desc = "[LSP] prev diagnostic" })
			map('n', '<leader>ldn', vim.diagnostic.goto_next, { desc = "[LSP] next diagnostic" })
			map('n', '<leader>ldl', vim.diagnostic.setloclist, { desc = "[LSP] diagnostic list" })
			map('n', '<leader>lds', vim.diagnostic.show, { desc = "[LSP] show diagnostic" })
			map('n', '<leader>ldh', vim.diagnostic.hide, { desc = "[LSP] hide diagnostic"})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
					vim.bo[ev.buf].tagfunc = ''

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[LSP] goto declaration" })
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "[LSP] goto definition" })
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "[LSP] hover doc" })
					vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[LSP] goto implementation" })
					vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[LSP] signature help" })
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "[LSP] add workspace folder" })
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "[LSP] remove workspace folder" })
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { buffer = ev.buf, desc = "[LSP] list workspace folders" })
					vim.keymap.set('n', 'go', vim.lsp.buf.type_definition,
						{ buffer = ev.buf, desc = "[LSP] type definition" })
					-- vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,
					-- 	{ buffer = ev.buf, desc = "[LSP] rename" })
					-- vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[LSP] code action" })
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "[LSP] goto references" })
					-- vim.keymap.set('n', '<leader>lf', function()
					-- 	vim.lsp.buf.format { async = true }
					-- end, { buffer = ev.buf, desc = "[LSP] format" })
				end,
			})
		end
	},
}
