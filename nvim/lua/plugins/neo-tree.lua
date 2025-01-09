return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	cmd = {
		"Neotree"
	},
	keys = {
			{
				"<leader>ee",
				"<Cmd>Neotree toggle<CR>",
				mode = {'n'},
				desc = "[neo-tree] toggle",
			},
			{
				"<leader>ef",
				"<Cmd>Neotree reveal<CR>",
				mode = {'n'},
				desc = "[neo-tree] find file",
			},

	},
	init = function()
		-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips#hijacking-netrw-when-loading-neo-tree-lazily
		vim.api.nvim_create_autocmd('BufEnter', {
			-- make a group to be able to delete it later
			group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
			callback = function()
				local f = vim.fn.expand('%:p')
				if vim.fn.isdirectory(f) ~= 0 then
					vim.cmd('Neotree current dir=' .. f)
					-- neo-tree is loaded now, delete the init autocmd
					vim.api.nvim_clear_autocmds{group = 'NeoTreeInit'}
				end
			end
		})
		-- keymaps
	end,
	opts = {
		close_if_last_window = false,
		filesystem = {
			-- hijack_netrw_behavior = "open_default",
			hijack_netrw_behavior = "open_current",
			-- "open_current",
			-- "disabled", 

		},
	},
}
