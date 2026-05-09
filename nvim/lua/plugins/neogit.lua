return {
	{
		"NeogitOrg/neogit",
		enabled = true,
		lazy = true,
		cmd = "Neogit",
		dependencies = {
			-- Only one of these is needed.
			"sindrets/diffview.nvim",        -- optional
			"esmuellert/codediff.nvim",      -- optional

			-- For a custom log pager
			"m00qek/baleia.nvim",            -- optional

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",              -- optional
			"nvim-mini/mini.pick",           -- optional
			"folke/snacks.nvim",             -- optional
		},
		opts = {},
	},
}
