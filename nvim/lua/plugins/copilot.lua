local copilot_enable = false

return {
	{
		"zbirenbaum/copilot.lua",
		enabled = copilot_enable,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end
	},

	{
		"zbirenbaum/copilot-cmp",
		enabled = copilot_enable,
		dependencies = "zbirenbaum/copilot.lua",
		after = 'zbirenbaum/copilot.lua',
		config = function ()
			require("copilot_cmp").setup()
		end
	},
}
