return {
	{
		"nvimdev/lspsaga.nvim",
		event = 'LspAttach',
		keys = {
			{
				"<leader>la",
				"<Cmd>Lspsaga code_action<CR>",
				mode = {'n'},
				desc = "[lspsaga] code action",
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
		opts = {},
	},
}
