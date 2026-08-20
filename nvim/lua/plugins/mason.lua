return {
	{
		"williamboman/mason.nvim",
		init = function()
			local mason_bin = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin")
			local path_separator = vim.fn.has("win32") == 1 and ";" or ":"
			vim.env.PATH = table.concat({ mason_bin, vim.env.PATH }, path_separator)
		end,
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonUpdate",
			"MasonLog",
		},
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cmd = { "LspInstall", "LspUninstall" },
		dependencies = "williamboman/mason.nvim",
		opts = {
			automatic_enable = false,
		},
	},
}
