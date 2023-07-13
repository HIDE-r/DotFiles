local lspconfig = require'lspconfig'
lspconfig.util.default_config = vim.tbl_extend(
"force",
lspconfig.util.default_config,
{
	autostart = false,
}
)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.diagnostic.disable()
local diagnostics_active = false
vim.keymap.set('n', '<leader>ldt', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
	vim.diagnostic.enable()
  else
	vim.diagnostic.disable()
	-- vim.diagnostic.disable()
  end
end)

-- Mappings.
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ldd', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ldp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>ldn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ldl', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<leader>lds', vim.diagnostic.show, opts)
vim.keymap.set('n', '<leader>ldh', vim.diagnostic.hide, opts)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>lwl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>lgt', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>lf', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local lsp_capabilities=vim.lsp.protocol.make_client_capabilities()
lsp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)

-------------------------------------------------------- LSP Server Configuration
require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	semanticHighlighting=true,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}

require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities,
  	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- enable = false,
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

require('lspconfig')['vimls'].setup {
  	capabilities = capabilities,
}

require('lspconfig')['bashls'].setup {
  	capabilities = capabilities,
}
