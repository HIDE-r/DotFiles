-- Visualize tree of caller functions and called functions.
-- :CsStackView open down <sym> Opens "downward" stack showing all the functions who call the <sym>.
-- :CsStackView open up <sym> Opens "upward" stack showing all the functions called by the <sym>.
-- In CsStackView window, use following keymaps
-- <tab> toggle child under cursor
-- <cr> open location of symbol under cursor
-- q close window
-- :CsStackView toggle reopens last CsStackView window.
-- In CsStackView window, all nodes that are part of current stack are highlighted.
return {
	{
		"dhananjaylatkar/cscope_maps.nvim",
		dependencies = {
			"folke/which-key.nvim", -- optional [for whichkey hints]
			"nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
			"ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
			"nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
		},
		opts = {
			cscope = {
				picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
			}
		},
	},
}
