return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		'kevinhwang91/promise-async',
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter'
	},
	keys = {
		{
			"zR",
			function()
				require('ufo').openAllFolds()
			end,
			mode = {'n'},
			desc = "[nvim-ufo] open all folds",
		},
		{
			"zM",
			function()
				require('ufo').closeAllFolds()
			end,
			mode = {'n'},
			desc = "[nvim-ufo] close all folds",
		},
		{
			"zk",
			function()
				require('ufo').peekFoldedLinesUnderCursor()
			end,
			mode = {'n'},
			desc = "[nvim-ufo] preview folded line",
		},
	},
	init = function ()
		vim.o.foldcolumn = '1' -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require('ufo').setup({
			provider_selector = function(bufnr, filetype, buftype)
				return {'treesitter', 'indent'}
			end
		})
		-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "[nvim-ufo] open all folds" })
		-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "[nvim-ufo] close all folds" })
		-- vim.keymap.set('n', 'zk', require('ufo').peekFoldedLinesUnderCursor, { desc = "[nvim-ufo] peek folded line under cursor" })
	end
}
