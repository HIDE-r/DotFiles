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

	{
		"ludovicchabant/vim-gutentags",
		enabled = false,
		after = "cscope_maps.nvim",
		init = function()
			vim.g.gutentags_modules = {"cscope_maps"} -- This is required. Other config is optional
			vim.g.gutentags_cscope_build_inverted_index_maps = 1
			vim.g.gutentags_cache_dir = vim.fn.expand("~/code/.gutentags")
			vim.g.gutentags_file_list_command = "fd -e c -e h"
			-- vim.g.gutentags_trace = 1
		end,
	},
}
