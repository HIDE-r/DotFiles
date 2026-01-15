return {
	{
		'dnlhc/glance.nvim',
		enabled = true,
		cmd = "Glance",
		keys = {
			{
				"gd",
				"<Cmd>Glance definitions<CR>",
				mode = {'n'},
				desc = "[glance] definitions",
			},
			{
				"<leader>lr",
				"<Cmd>Glance references<CR>",
				mode = {'n'},
				desc = "[glance] references",
			},
			{
				"<leader>lo",
				"<Cmd>Glance resume<CR>",
				mode = {'n'},
				desc = "[glance] resume",
			},
			{
				"<leader>lt",
				"<Cmd>Glance type_definitions<CR>",
				mode = {'n'},
				desc = "[glance] type_definitions",
			},
			{
				"<leader>li",
				"<Cmd>Glance implementations<CR>",
				mode = {'n'},
				desc = "[glance] implementations",
			},
		},
		opts = {}
	}
}
