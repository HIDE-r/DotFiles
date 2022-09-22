-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ldd', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ldp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>ldn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ldl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>lK', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>lgt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	semanticHighlighting=true,
}

require('lspconfig')['sumneko_lua'].setup {
	capabilities = capabilities,
	on_attach = on_attach, flags = lsp_flags,
  	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
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
	on_attach = on_attach,
	flags = lsp_flags,
}

require('lspconfig')['bashls'].setup {
  	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
