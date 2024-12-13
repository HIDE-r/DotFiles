return {
	{
		'Bekaboo/dropbar.nvim',
		enabled = false,
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		opts = {},
		config = function (_,opts)
			vim.ui.select = require('dropbar.utils.menu').select
		end
	}
}
