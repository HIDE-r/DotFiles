return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
			{
				"<leader>ee",
				"<Cmd>Neotree toggle<CR>",
				mode = {'n'},
				desc = "[neo-tree] toggle",
			},
			{
				"<leader>ef",
				"<Cmd>Neotree reveal<CR>",
				mode = {'n'},
				desc = "[neo-tree] find file",
			},

	},
	opts = {
		close_if_last_window = true,
	},
}
