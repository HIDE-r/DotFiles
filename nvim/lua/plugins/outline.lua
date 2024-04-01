return {
	{
		"hedyhli/outline.nvim",
		enabled = false,
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "[outline] toggle outline" },
		},
		opts = {
		},
	},

}
