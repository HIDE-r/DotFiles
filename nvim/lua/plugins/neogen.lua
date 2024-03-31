return {
	--- Annotation
	{
		'danymat/neogen',
		cmd = "Neogen",
		keys = {
			{
				"<leader>a",
				"<Cmd>Neogen<CR>",
				mode = {'n', 'v'},
				desc = "[neogen] annotation",
			},
		},
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},
}
