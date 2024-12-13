return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		keys = {
			{
				"<leader>ti",
				"<Cmd>IBLToggle<CR>",
				mode = {'n'},
				desc = "[indent-blankline] indent line toggle",
			},
		},
		main = 'ibl',
		opts = {
			enabled = false,
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		}
	},
}
