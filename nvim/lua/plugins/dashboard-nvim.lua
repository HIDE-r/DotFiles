return {
	{
		'glepnir/dashboard-nvim',
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
				project = { enable = false },
				mru = { limit = 15 },
				-- project = { enable = true, limit = 8, action = 'Telescope find_files cwd=~/Public/Project' },
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
						desc = ' Todo',
						group = 'DiagnosticHint',
						action = 'TodoTelescope',
						key = 't',
					},
					{
						desc = '󱥬 Bookmarks',
						group = 'Number',
						action = 'Telescope vim_bookmarks',
						key = 'b',
					},
				},
				-- footer = {},
			},
		}
	},
}
