
return {
	{
		'nvim-telescope/telescope.nvim',
		keys = {
			-- {
			-- 	"<leader>ff",
			-- 	"<Cmd>Telescope find_files<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] file (cwd)",
			-- },
			-- {
			-- 	"<leader>fb",
			-- 	"<Cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim buffers",
			-- },
			-- {
			-- 	"<leader>fB",
			-- 	"<Cmd>Telescope current_buffer_fuzzy_find<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] search in buffer ",
			-- },
			-- {
			-- 	"<leader>fr",
			-- 	"<Cmd>Telescope resume<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] resume",
			-- },
			-- {
			-- 	"<leader>f/",
			-- 	"<Cmd>Telescope live_grep<CR>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] grep",
			-- },
			-- {
			-- 	"<leader>f:",
			-- 	"<cmd>Telescope command_history<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim command history",
			-- },
			-- {
			-- 	"<leader>f\"",
			-- 	"<cmd>Telescope registers<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim registers",
			-- },
			-- {
			-- 	"<leader>fa",
			-- 	"<cmd>Telescope autocommands<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim autocommands",
			-- },
			{
				"<leader>fo",
				"<cmd>Telescope vim_options<cr>",
				mode = {'n'},
				desc = "[telescope] vim option",
			},
			-- {
			-- 	"<leader>fk",
			-- 	"<cmd>Telescope keymaps<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim keymaps",
			-- },
			-- {
			-- 	"<leader>fh",
			-- 	"<cmd>Telescope help_tags<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] vim help pages",
			-- },
			-- {
			-- 	"<leader>fd",
			-- 	"<cmd>Telescope diagnostics bufnr=0<cr>",
			-- 	mode = {'n'},
			-- 	desc = "[telescope] document diagnostics",
			-- },

		},
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
			},
		},
		opts = {},
		config = function(_,opts)
			local action_layout = require("telescope.actions.layout")
			opts.defaults = {
				mappings = {
					i = {
						["<M-p>"] = action_layout.toggle_preview
					}
				}
			}

			require('telescope').setup(opts)
		end
	},
}
