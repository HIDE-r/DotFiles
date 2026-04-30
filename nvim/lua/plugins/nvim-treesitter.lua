return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		opts = {
			ensure_installed = {
				"c", "cpp", "lua", "yaml", "markdown", "rust"
			},
			auto_install = true,
			highlight = {
				enable = true,
		-- 		additional_vim_regex_highlighting = false,
			},
		-- 	matchup = {
		-- 		enable = true,              -- mandatory, false will disable the whole extension
		-- 	},
		},
		config = function(_, opts)
			require'nvim-treesitter.configs'.setup(opts)
		end
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		enabled = false,
		dependencies = 'nvim-treesitter/nvim-treesitter',
	},
}

