return {
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			{
				'junegunn/fzf',
				"junegunn/fzf.vim",
				build = function()
					vim.fn['fzf#install']()
				end
			},
		},
	},
}
