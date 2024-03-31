return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = {
					"vim", "c","cpp", "lua", "yaml", "markdown", "markdown_inline"
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				matchup = {
					enable = true,              -- mandatory, false will disable the whole extension
				},
			}
		end
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		enabled = false,
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},
}

