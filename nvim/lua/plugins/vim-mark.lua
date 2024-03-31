return {
	{
		'inkarkat/vim-mark',
		dependencies = {
			{
				'inkarkat/vim-ingo-library',
				branch = 'stable',
			}
		},
		keys = {
			{
				"<leader>mm",
				-- "<Cmd>lua vim.cmd [[execute \"normal \\<Plug>MarkSet\"]]<CR>",
				[[<Plug>MarkSet]],
				mode = {"n", "v"},
				desc = "[vim-mark] mark",
			},
			{
				"<leader>mr",
				[[<Plug>MarkRegex]],
				mode = {"n"},
				desc = "[vim-mark] mark by regex",
			},
			{
				"<leader>mc",
				[[<cmd>MarkClear<CR>]],
				mode = {"n"},
				desc = "[vim-mark] mark clear",
			},
			{
				"<leader>mn",
				[[<Plug>MarkSearchCurrentNext]],
				mode = {"n"},
				desc = "[vim-mark] mark current next",
			},
			{
				"<leader>mp",
				[[<Plug>MarkSearchCurrentPrev]],
				mode = {"n"},
				desc = "[vim-mark] mark current prev",
			},
			{
				"<leader>mj",
				[[<Plug>MarkSearchAnyNext]],
				mode = {"n"},
				desc = "[vim-mark] mark any next",
			},
			{
				"<leader>mk",
				[[<Plug>MarkSearchAnyPrev]],
				mode = {"n"},
				desc = "[vim-mark] mark any prev",
			},
		},
		branch = 'stable',
		init = function()
			vim.g.mw_no_mappings = 1
			vim.g.mwDefaultHighlightingPalette = 'extended'
			vim.g.mwDefaultHighlightingNum = 10
		end,
	},
}
