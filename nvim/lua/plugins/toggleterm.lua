return {
	{
		'akinsho/toggleterm.nvim',
		cmd = "ToggleTerm",
		keys = {
			'<C-\\>',
		},
		version = "*",
		init = function()
			function _G.set_terminal_keymaps()
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = 0
					vim.keymap.set(mode, l, r, opts)
				end
				-- vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], opts)
				map('t', '<C-q>', [[<C-\><C-n>]], { desc = "[toggleterm] normal mode"})
				map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = "[toggleterm] left"})
				map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = "[toggleterm] down"})
				map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = "[toggleterm] up"})
				map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = "[toggleterm] right"})
				map('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = "[toggleterm] select window"})
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end,
		opts = {
			open_mapping = [[<C-\>]],
			insert_mappings = true,
			winbar = {
				enabled = true,
			},
		}
	},
}
