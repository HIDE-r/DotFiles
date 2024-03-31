return {
	{
		'natecraddock/workspaces.nvim',
		enabled = false,
		dependencies = { 
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			require("workspaces").setup()
			require('telescope').load_extension("workspaces")
		end,
	},
}
