return {
	'nvim-telescope/telescope-file-browser.nvim',
	enabled = false,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>eb",
			[[<Cmd>Telescope file_browser<CR>]],
			mode = {'n'},
			desc = "[telescope] browser",
		},
	},
	config = function ()
		require("telescope").load_extension "file_browser"
	end
}
