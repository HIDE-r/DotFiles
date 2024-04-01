return {
	{
		'nvim-tree/nvim-tree.lua',
		cmd = "NvimTreeToggle",
		keys = {
			{
				"<leader>ee",
				"<Cmd>NvimTreeToggle<CR>",
				mode = {'n'},
				desc = "[nvim-tree] toggle",
			},
			{
				"<leader>ef",
				"<Cmd>NvimTreeFindFile<CR>",
				mode = {'n'},
				desc = "[nvim-tree] find file",
			},
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		-- version = 'nightly', -- optional, updated every week. (see issue #1193)
		init = function()
			-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
			local function open_nvim_tree(data)

				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if not directory then
					return
				end

				-- change to the directory
				vim.cmd.cd(data.file)

				-- open the tree
				vim.cmd([[NvimTreeToggle]])
			end

			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		end,
		opts = {},
	},
}
