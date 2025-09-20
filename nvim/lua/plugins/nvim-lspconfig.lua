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
			-- { "folke/neoconf.nvim", opts = {} },
			-- { "folke/neodev.nvim", opts = {} },
		},
		config = function()

			local diagnostic_signs = {
				[vim.diagnostic.severity.ERROR] = ' ',
				[vim.diagnostic.severity.WARN] = ' ',
				[vim.diagnostic.severity.HINT] = ' ',
				[vim.diagnostic.severity.INFO] = ' ',
			}

			-- diagnostics signs
			if vim.fn.has("nvim-0.10.0") == 0 then
				for severity, icon in pairs(diagnostic_signs) do
					local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
					name = "DiagnosticSign" .. name
					vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
				end
			end

			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.diagnostic.enable(false)
			local diagnostics_active = false
			map('n', '<leader>dt', function()
				diagnostics_active = not diagnostics_active
				if diagnostics_active then
					vim.diagnostic.enable(true)
				else
					vim.diagnostic.enable(false)
				end
			end, {desc = "[LSP] toggle diagnostic"})


			-- Mappings.
			map('n', '<leader>dd', vim.diagnostic.open_float, { desc = "[LSP] diagnostic detail on float" })
			map('n', '[d', vim.diagnostic.goto_prev, { desc = "[LSP] prev diagnostic" })
			map('n', ']d', vim.diagnostic.goto_next, { desc = "[LSP] next diagnostic" })
			map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = "[LSP] prev diagnostic" })
			map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = "[LSP] next diagnostic" })
			map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "[LSP] diagnostic list" })
			map('n', '<leader>ds', vim.diagnostic.show, { desc = "[LSP] show diagnostic" })
			map('n', '<leader>dh', vim.diagnostic.hide, { desc = "[LSP] hide diagnostic"})


			-- help lsp-defaults-disable 
			vim.keymap.del('n', 'grn')
			vim.keymap.del('n', 'grr')
			vim.keymap.del('n', 'gra')
			vim.keymap.del('n', 'gri')

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
					vim.bo[ev.buf].omnifunc = ''

					-- help lsp-defaults-disable
					vim.bo[ev.buf].tagfunc = ''
					-- vim.keymap.del("n", "K", { buffer = ev.buf })

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[LSP] goto declaration" })
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "[LSP] goto definition" })
					vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[LSP] goto implementation" })
					vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "[LSP] type definition" })
					vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, { buffer = ev.buf, desc = "[LSP] document symbol" })
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "[LSP] goto references" })

					-- vim.keymap.set('n', 'gk', vim.lsp.buf.hover, { buffer = ev.buf, desc = "[LSP] hover doc" })
					vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "[LSP] signature help" })
--[[
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "[LSP] add workspace folder" })
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "[LSP] remove workspace folder" })
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { buffer = ev.buf, desc = "[LSP] list workspace folders" })
]]
					-- vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,
					-- 	{ buffer = ev.buf, desc = "[LSP] rename" })
					-- vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[LSP] code action" })
					-- vim.keymap.set('n', '<leader>lf', function()
					-- 	vim.lsp.buf.format { async = true }
					-- end, { buffer = ev.buf, desc = "[LSP] format" })
				end,
			})
		end
	},
}
