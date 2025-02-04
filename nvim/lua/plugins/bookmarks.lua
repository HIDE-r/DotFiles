return {
	{
		"LintaoAmons/bookmarks.nvim",
		-- pin the plugin at specific version for stability
		-- backup your bookmark sqlite db when there are breaking changes
		-- tag = "v2.3.0",
		cmd = {"BookmarksLists"},
		keys = {
			{
				"<leader>bb",
				mode = {'n', 'v'},
				[[<cmd>BookmarksMark<CR>]],
				desc = "[bookmark] mark",
			},
			{
				"<leader>bt",
				mode = {'n'},
				[[<cmd>BookmarksTree<CR>]],
				desc = "[bookmark] tree",
			},
			{
				"<leader>bl",
				mode = {'n'},
				[[<cmd>BookmarksLists<CR>]],
				desc = "[bookmark] list",
			},
			{
				"<leader>bg",
				mode = {'n'},
				[[<cmd>BookmarksGoto<CR>]],
				desc = "[bookmark] goto",
			},
			{
				"<leader>bn",
				mode = {'n'},
				[[<cmd>BookmarksGotoNext<CR>]],
				desc = "[bookmark] next",
			},
			{
				"<leader>bp",
				mode = {'n'},
				[[<cmd><BookmarksGotoPrevCR>]],
				desc = "[bookmark] previous",
			},
		},
		dependencies = {
			{"kkharji/sqlite.lua"},
			{"nvim-telescope/telescope.nvim"},
			{"stevearc/dressing.nvim"} -- optional: better UI
		},
		config = function()
			local opts = {
				signs = {
					mark = {
						color = "red",
						line_bg = "",
					}
				},
				treeview = {
					keymap = {
						quit = { "q", "<ESC>" },      -- Close the tree view window and return to previous window
						refresh = "R",                -- Reload and redraw the tree view
						create_list = "a",            -- Create a new list under the current node
						level_up = "u",               -- Navigate up one level in the tree hierarchy
						set_root = ".",               -- Set current list as root of the tree view, also set as active list
						set_active = "m",             -- Set current list as the active list for bookmarks
						toggle = "o",                 -- Toggle list expansion or go to bookmark location
						move_up = "<localleader>k",   -- Move current node up in the list
						move_down = "<localleader>j", -- Move current node down in the list
						delete = "D",                 -- Delete current node
						rename = "r",                 -- Rename current node
						goto = "g",                   -- Go to bookmark location in previous window
						cut = "x",                    -- Cut node
						copy = "c",                   -- Copy node
						paste = "p",                  -- Paste node
						show_info = "i",              -- Show node info
						reverse = "t",                -- Reverse the order of nodes in the tree view
					},
					-- Dimension of the window spawned for Treeview
					window_split_dimension = 30,
					-- stylua: ignore end
				}
			} -- go to the following link to see all the options in the deafult config file
			require("bookmarks").setup(opts) -- you must call setup to init sqlite db
		end,
	}

	-- run :BookmarksInfo to see the running status of the plugin
}
