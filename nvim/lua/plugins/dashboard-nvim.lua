return {
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		enabled = vim.g.have_nerd_font,
		-- enabled = false,
		dependencies = { {'nvim-tree/nvim-web-devicons'} },
		opts = {
			theme = 'hyper',
			shortcut_type = 'number',
			config = {
				week_header = { enable=true },
				packages = { enable = true },
				project = { enable = false, limit = 8, action = 'Telescope find_files cwd=' },
				mru = { limit = 15 },
				shortcut = {
					{
						icon = '󰊳 ',
						desc = 'Update',
						group = '@property',
						action = 'Lazy update',
						key = 'u'
					},
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Project',
						group = 'DiagnosticHint',
						action = 'Telescope workspaces',
						key = 'p',
					},
					{
						desc = '󱥬 Bookmarks',
						group = 'Number',
						action = 'BookmarksLists',
						key = 'b',
					},
				},
				footer = {
					"",
					"",
					"🌲 The best time to plant a tree is 20 years ago. The second-best time is now.",
				},
			},
		}
	},
}
