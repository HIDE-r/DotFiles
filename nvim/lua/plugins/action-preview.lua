return {
	'aznhe21/actions-preview.nvim',
	opts = {},
	keys = {
		{ "ga", mode = { "n", "v" }, function() require("actions-preview").code_actions() end, desc = "[LSP] action" },
		-- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	},

}
