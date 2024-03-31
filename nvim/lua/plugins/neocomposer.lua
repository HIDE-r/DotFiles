return {
	{
		"ecthelionvi/NeoComposer.nvim",
		enabled = false,
		dependencies = { 
			"kkharji/sqlite.lua", 
			'nvim-telescope/telescope.nvim',
			'nvim-lualine/lualine.nvim',
		},
		keys = {
			{
				"q",
				[[<Plug>toggle_record]],
				mode = {'n'},
				desc = "marco record",
			},
		},
		opts = {
			keymaps = {
				play_macro = "Q",
				yank_macro = "yq",
				stop_macro = "cq",
				toggle_record = "q",
				cycle_next = "<c-n>",
				cycle_prev = "<c-p>",
				toggle_macro_menu = "<m-q>",
			},
		},
		config = function()
			require("NeoComposer").setup(opts)
			require('telescope').load_extension('macros')
		end
	},
}
