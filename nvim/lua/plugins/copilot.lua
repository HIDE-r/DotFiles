return {
	{
		"github/copilot.vim",
		enabled = vim.g.copilot_engine == "copilot.vim",
		filetypes = {
			["grug-far"] = false,
			["grug-far-history"] = false,
			["grug-far-help"] = false,
		},
	},

	{
		"zbirenbaum/copilot.lua",
		enabled = vim.g.copilot_engine == "copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		filetypes = {
			["grug-far"] = false,
			["grug-far-history"] = false,
			["grug-far-help"] = false,
		},
		config = function()
			require("copilot").setup({
				-- 通过 virtual text 猜测需要的补全
				suggestion = {
					enabled = false,
			},
				panel = {
					enabled = false,
				},
			})
		end
	},

	{
		"zbirenbaum/copilot-cmp",
		enabled = vim.g.completion == "nvim-cmp" and vim.g.copilot_engine == "copilot.lua",
		dependencies = "zbirenbaum/copilot.lua",
		after = 'zbirenbaum/copilot.lua',
		config = function ()
			require("copilot_cmp").setup()
		end
	},
}
