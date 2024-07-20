-- Open the tree: :NvimTreeOpen
-- Show the mappings: g?

return {
	{
		'nvim-tree/nvim-tree.lua',
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
		},
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
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

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

			-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local tree_wins = {}
					local floating_wins = {}
					local wins = vim.api.nvim_list_wins()
					for _, w in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
						if bufname:match("NvimTree_") ~= nil then
							table.insert(tree_wins, w)
						end
						if vim.api.nvim_win_get_config(w).relative ~= '' then
							table.insert(floating_wins, w)
						end
					end
					if 1 == #wins - #floating_wins - #tree_wins then
						-- Should quit, so we close all invalid windows.
						for _, w in ipairs(tree_wins) do
							vim.api.nvim_win_close(w, true)
						end
					end
				end
			})
		end,
		opts = {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		},
	},
}
