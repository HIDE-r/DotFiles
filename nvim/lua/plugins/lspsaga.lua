return {
	{
		"nvimdev/lspsaga.nvim",
		enabled = true,
		event = 'LspAttach',
		keys = {
			-- {
			-- 	"<leader>la",
			-- 	"<Cmd>Lspsaga code_action<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[lspsaga] code action",
			-- },
			{
				"K",
				"<Cmd>Lspsaga hover_doc<CR>",
				mode = {'n'},
				desc = "[lspsaga] hover doc",
			},
			{
				"]d",
				"<Cmd>Lspsaga diagnostic_jump_next<CR>",
				mode = {'n'},
				desc = "[lspsaga] next diagnostic",
			},
			{
				"[d",
				"<Cmd>Lspsaga diagnostic_jump_prev<CR>",
				mode = {'n'},
				desc = "[lspsaga] prev diagnostic",
			},
			-- {
			-- 	"<leader>ld",
			-- 	"<Cmd>Lspsaga peek_definition<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[lspsaga] definition",
			-- },
			{
				"<leader>lf",
				"<Cmd>Lspsaga finder def+ref+imp<CR>",
				mode = {'n'},
				desc = "[lspsaga] symbol's info",
			},
		},
		dependencies = {
			{"nvim-tree/nvim-web-devicons"},
			--Please make sure you install markdown and markdown_inline parser
			{"nvim-treesitter/nvim-treesitter"}
		},
		opts = {
			symbol_in_winbar = {
				-- show_file = false,
			}
		},
	},
}
