return {
	{
		"aserowy/tmux.nvim",
		event = "VeryLazy",
		opts = {
			-- overwrite default configuration
			-- here, e.g. to enable default bindings
			copy_sync = {
				-- enables copy sync and overwrites all register actions to
				-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
				enable = false,
				redirect_to_clipboard = false,
			},
			navigation = {
				-- enables default keybindings (C-hjkl) for normal mode
				enable_default_keybindings = true,
			},
			resize = {
				-- enables default keybindings (A-hjkl) for normal mode
				enable_default_keybindings = true,
			}
		},
	},
}
