local kopts = {buffer = 0}

-- 2<C-\>, 将会打开 id 为 2 的terminal
return {
	{
		'akinsho/toggleterm.nvim',
		cmd = "ToggleTerm",
		keys = {
			{
				'<C-\\>',
 				mode = {'n'},
				desc = "[toggleterm] toggle terminal",
			},
			{
				'<C-q>',
				[[<C-\><C-n>]],
 				mode = {'t'},
				desc = "[toggleterm] back to normal mode",
				kopts,
			},
			{
				'<C-h>',
				"<Cmd>wincmd h<CR>",
 				mode = {'t'},
				desc = "[toggleterm] move to left window",
				kopts,
			},
			{
				'<C-j>',
				"<Cmd>wincmd j<CR>",
 				mode = {'t'},
				desc = "[toggleterm] move to bottom window",
				kopts,
			},
			{
				'<C-k>',
				"<Cmd>wincmd k<CR>",
 				mode = {'t'},
				desc = "[toggleterm] move to top window",
				kopts,
			},
			{
				'<C-l>',
				"<Cmd>wincmd l<CR>",
 				mode = {'t'},
				desc = "[toggleterm] move to right window",
				kopts,
			},
			{
				'<C-w>',
				[[<C-\><C-n><C-w>]],
 				mode = {'t'},
				desc = "[toggleterm] select window",
				kopts,
			},
		},
		version = "*",
		-- init = function()
			-- function _G.set_terminal_keymaps()
				-- local function map(mode, l, r, opts)
				-- 	opts = opts or {}
				-- 	opts.buffer = 0
				-- 	vim.keymap.set(mode, l, r, opts)
				-- end
				-- vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], opts)
				-- map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = "[toggleterm] left"})
				-- map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = "[toggleterm] down"})
				-- map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = "[toggleterm] up"})
				-- map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = "[toggleterm] right"})
				-- map('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = "[toggleterm] select window"})
			-- end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		-- end,
		opts = {
			open_mapping = [[<C-\>]],
			insert_mappings = true,
			-- direction = 'float',
			winbar = {
				enabled = true,
			},
		}
	},
}
