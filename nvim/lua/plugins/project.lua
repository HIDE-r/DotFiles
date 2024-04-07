return {
	'ahmedkhalf/project.nvim',
	enabled = false,
	dependencies = {
		'nvim-telescope/telescope.nvim',
	},
	opts = {},
	config = function (_, opts)
		require("project_nvim").setup(opts)
		require('telescope').load_extension('projects')
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true
			},
		})
	end
}
