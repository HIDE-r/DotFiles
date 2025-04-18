--[[
1. When the WhichKey popup is open, you can use the following key bindings (they are also displayed at the bottom of the screen):

- hit one of the keys to open a group or execute a key binding
- <esc> to cancel and close the popup
- <bs> go up one level
- <c-d> scroll down
- <c-u> scroll up

2. Apart from the automatic opening, you can also manually open WhichKey for a certain prefix:
:WhichKey  					"show all mappings
:WhichKey <leader> 				"show all <leader> mappings
:WhichKey <leader> v 				"show all <leader> mappings for VISUAL mode
:WhichKey '' v 					"show ALL mappings for VISUAL mode
]]

local leader_mapping = {
	{
		mode = { "n", "v" },
		{ "<leader>b", group = "bookmark" },
		{ "<leader>h", group = "git" },
		{ "<leader>m", group = "mark" },
		{ "<leader>t", group = "applet" },
		{ "<leader>tl", "<cmd>set list!<cr>", desc = "[customize] list mode" },
		{ "<leader>tn", "<cmd>set number!<cr>", desc = "[customize] line number" },
		{ "<leader>ts", "<cmd>nohlsearch<cr>", desc = "[customize] highlight search" },
		{ "<leader>tf", function()
			local current_ff = vim.bo.fileformat
			if current_ff == "unix" then
				vim.bo.fileformat = "dos"
			else
				vim.bo.fileformat = "unix"
			end
		end, desc = "[customize] file format" },
		{ "<leader>ll", "<cmd>LspStart<cr>", desc = "[customize] lsp start" },
	},
	{
		{ "<leader>d", group = "diagnostic" },
		{ "<leader>e", group = "file explorer" },
		{ "<leader>f", group = "find" },
		{ "<leader>s", group = "search" },
		{ "<leader>ht", group = "toggle" },
		{ "<leader>l", group = "lspsaga" },
		{ "<leader>p", group = "lazy" },
		{ "<leader>pl", "<cmd>Lazy show<cr>", desc = "[Lazy] status" },
		{ "<leader>pp", "<cmd>Lazy profile<cr>", desc = "[Lazy] profile" },
		{ "<leader>ps", "<cmd>Lazy sync<cr>", desc = "[Lazy] sync" },
		{ "<leader>w", group = "workspace" },
	},
}

return {
	{
		"folke/which-key.nvim",
		dependencies = {
			{'nvim-tree/nvim-web-devicons'},
			-- {'echasnovski/mini.icons'}
		},
		event = "VeryLazy",
		opts = {
			defaults = {
				{
					mode = { "n", "v" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "z", group = "fold" },
				},
			},
			icons = {
				rules = false
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add(leader_mapping)
			wk.add(opts.defaults)
		end
	},
}
