return {
	{
		'MattesGroeger/vim-bookmarks',
		dependencies = {
			{
				'tom-anders/telescope-vim-bookmarks.nvim',
				dependencies = 'nvim-telescope/telescope.nvim',
				config = function()
					require('telescope').load_extension('vim_bookmarks')
				end
			},
		},
		keys = {
			{
				"<leader>bm",
				[[<Plug>BookmarkToggle]],
 				mode = {'n'},
				desc = "[bookmark] toggle",
			},
			{
				"<leader>bi",
				[[<Plug>BookmarkAnnotate]],
 				mode = {'n'},
				desc = "[bookmark] annotate",
			},
			{
				"<leader>ba",
				[[<Cmd>Telescope vim_bookmarks all<CR>]],
 				mode = {'n'},
				desc = "[bookmark] show all mark",
			},
			{
				"<leader>bn",
				[[<Plug>BookmarkNext]],
 				mode = {'n'},
				desc = "[bookmark] next mark",
			},
			{
				"<leader>bp",
				[[<Plug>BookmarkPrev]],
 				mode = {'n'},
				desc = "[bookmark] prev mark",
			},
			{
				"<leader>bc",
				[[<Plug>BookmarkClear]],
 				mode = {'n'},
				desc = "[bookmark] clear current buffer mark",
			},
			{
				"<leader>bx",
				[[<Plug>BookmarkClearAll]],
 				mode = {'n'},
				desc = "[bookmark] clear all mark",
			},
			{
				"<leader>bj",
				[[<Plug>BookmarkMoveDown]],
 				mode = {'n'},
				desc = "[bookmark] move down",
			},
			{
				"<leader>bk",
				[[<Plug>BookmarkMoveUp]],
 				mode = {'n'},
				desc = "[bookmark] move up",
			},
			{
				"<leader>bg",
				[[<Plug>BookmarkMoveToLine]],
 				mode = {'n'},
				desc = "[bookmark] move to line",
			},
		},
		init = function()
			vim.g.bookmark_no_default_key_mappings = 1
		end,
	},
}
