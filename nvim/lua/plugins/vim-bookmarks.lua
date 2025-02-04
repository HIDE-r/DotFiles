return {
	{
		'MattesGroeger/vim-bookmarks',
		enabled = false,
		keys = {
			{
				"<leader>bb",
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
				"<leader>bl",
				[[<Plug>BookmarkShowAll]],
 				mode = {'n'},
				desc = "[bookmark] list all mark",
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
			vim.g.bookmark_auto_save = 1
		end,
	},
}
