-- Workspaces: 指项目目录
-- Dirs: 指包含许多项目的目录, 比如 /project/dwm, /project/openwrt, 这里 /project 就是一个 dir

-- :WorkspacesAdd [name] [path]
-- The workspace with the specified name and path will be registered.

-- :WorkspacesAddDir [path]
-- The directory with the specified or current path will be registered and each one of its sub folders stored as workspaces.

-- :WorkspacesRemove [name]
-- The workspace with the specified name will be removed.

-- :WorkspacesRemoveDir [name]
-- The directory with the specified name will be removed as well as all of its associated workspaces.

-- :WorkspacesRename [name] [new_name]
-- The workspace with the specified name will be renamed to new_name.

-- :WorkspacesList
-- Prints all workspaces.

-- :WorkspacesListDirs
-- Prints all directories.

-- :WorkspacesOpen [name]
-- Opens the named workspace. opening a workspace means to change the current directory to that workspace's path.

-- :WorkspacesSyncDirs
-- Synchronize workspaces from registered directories.

return {
	{
		'natecraddock/workspaces.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			"nvim-neo-tree/neo-tree.nvim",
		},
		keys = {
			{
				"<leader>wl",
				[[<Cmd>Telescope workspaces<CR>]],
				mode = {'n'},
				desc = "[workspaces] list workspaces",
			},
			{
				"<leader>wa",
				[[<Cmd>WorkspacesAdd<CR>]], 
				mode = {'n'},
				desc = "[workspaces] add workspaces",
			},
			{
				"<leader>wd",
				[[<Cmd>WorkspacesRemove<CR>]],
				mode = {'n'},
				desc = "[workspaces] remove workspaces",
			},
		},
		opts = {
			-- 指定切换目录时要执行的动作
			hooks = {
				open = { "Yazi cwd" },
			},
		},
		config = function(_, opts)
			require("workspaces").setup(opts)
			require('telescope').load_extension("workspaces")
		end,
	},
}
