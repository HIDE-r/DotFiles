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

-- FIXME: https://github.com/folke/which-key.nvim/issues/482
local leader_mapping_nv = {
	t = {
		name = "toggle",
		s = { "<cmd>nohlsearch<cr>"		, "highlight search" },
		l = { "<cmd>set list!<cr>"		, "list mode" },
		n = { "<cmd>set number!<cr>"		, "line number" },
	},
	m = {
		name = "mark",
	},
	h = {
		name = "git",
	},
	b = {
		name = "bookmark",
	},
}

local leader_mapping_n = {
	ht = {
		name = "toggle",
	},
	p = {
		name = "lazy",
		l = { "<cmd>Lazy show<cr>"		, "[Lazy] status"},
		s = { "<cmd>Lazy sync<cr>"		, "[Lazy] sync"},
		p = { "<cmd>Lazy profile<cr>"		, "[Lazy] profile"},
	},
	w = {
		name = "workspace",
	},
	l = {
		name = "lsp",
	},
	ld = {
		name = "diagnostic",
	},
	f = {
		name = "telescope",
	},
	e = {
		name = "file explorer",
	},
}

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "goto" },
				["z"] = { name = "fold" },
				["]"] = { name = "next" },
				["["] = { name = "prev" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.register(leader_mapping_nv, {
				prefix = "<leader>",
				mode = {"n", "v"}
			})

			wk.register(leader_mapping_n, {
				prefix = "<leader>",
				mode = {"n"}
			})

			wk.register(opts.defaults)
		end
	},
}
