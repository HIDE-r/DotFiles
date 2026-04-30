return {
	'HIDE-r/conductor.nvim',
	opts = {
		default_keymap = "<C-p>",
		commands = {
			{
				id = "edit.init",
				title = "Edit init.lua",
				desc = "Open Neovim config",
				group = "Config",
				cmd = "edit $MYVIMRC",
			},
			{
				id = "lazy.sync",
				title = "Lazy Sync",
				desc = "Sync plugins",
				group = "Plugins",
				cmd = "Lazy sync",
			},
		},
	},
}
