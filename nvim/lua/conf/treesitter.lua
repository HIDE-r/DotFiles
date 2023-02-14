require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"vim", "c","cpp", "lua", "yaml", "markdown", "markdown_inline"
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,              -- mandatory, false will disable the whole extension
	},
}

