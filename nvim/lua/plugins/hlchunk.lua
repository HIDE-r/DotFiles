return {
	{
		"shellRaining/hlchunk.nvim",
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			chunk = {
				enable = false,
			},
			line_num = {
				enable = false,
			},
			indent = {
				enable = false,
			},
			blank = {
				enable = false,
				chars = {
					" ",
				},
				style = {
					{ bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
					{ bg = "", fg = "" },
				},
			},
		},
	},
}
