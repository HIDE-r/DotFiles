return {
	{
		"tenxsoydev/tabs-vs-spaces.nvim",
		opts = {
			highlight = {},
			-- cmd = {
			-- 	"TabsVsSpacesConvert",
			-- 	"TabsVsSpacesStandardize",
			-- 	"TabsVsSpacesToggle",
			-- },
			ignore = {
				filetypes = {
					"dashboard",
				},
				buftypes = {
					"acwrite",
					"help",
					"nofile",
					"nowrite",
					"quickfix",
					"terminal",
					"prompt",
				},
			},
			standartize_on_save = false,
			user_commands = true,
		},
	},
}
