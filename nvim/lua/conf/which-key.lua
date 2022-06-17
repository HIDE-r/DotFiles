require("which-key").setup {
}
local wk = require("which-key")

wk.register({
	r = {
		name = "reload/resume",
		c = { "<cmd>source $MYVIMRC<cr>"	, "vimrc" },
		h = { "<cmd>nohlsearch<cr>"		, "nohlsearch" },
		l = { "<cmd>set list!<cr>"		, "list mode" },
	},
	-- d = {
	-- 	name = "doxygen",
	-- 	d = { "<cmd>Dox<cr>"		, "doc"},
	-- 	l = { "<cmd>DoxLic<cr>"		, "license"},
	-- 	a = { "<cmd>DoxAuthor<cr>"	, "author"},
	-- },
	d = {
		name = "neogen",
		d = { "<cmd>Neogen<cr>"		, "annotation"},
	},
	m = {
		name = "mark",
		m = {"<Plug>MarkSet"			, "mark"},
		r = {"<Plug>MarkRegex"			, "mark by regex"},
		c = {"<cmd>MarkClear<cr>"		, "clear"},
		n = {"<Plug>MarkSearchCurrentNext"	, "current next"},
		p = {"<Plug>MarkSearchCurrentPrev"	, "current prev"},
		j = {"<Plug>MarkSearchAnyNext"		, "any next"},
		k = {"<Plug>MarkSearchAnyPrev"		, "any prev"},
	},
	p = {
		name = "packer",
		l = { "<cmd>PackerStatus<cr>"		, "status"},
		s = { "<cmd>PackerSync<cr>"		, "sync"},
		c = { "<cmd>PackerCompile<cr>"		, "compile"},
	},
	h = {
		name = "gitsigns",
		S = "stage buffer",
		s = "stage hunk",
		R = "reset buffer",
		r = "reset hunk",
		u = "undo stage hunk",
		p = "preview",
		b = "blame",
		D = "diff",
		d = "diff",
		t = {
			name = "toggle",
			b = "blame",
			d = "delete"
		}
	},
	f = {
		name = "leaderf/telescope",
		f = { "<cmd>LeaderfFile<cr>"		, "files"},
		t = {
			name = "tag",
			t = { "<cmd>LeaderfTag<cr>"		, "tag" },
			s = { "<cmd>Telescope tagstack<cr>"	, "tagstack"},
			r = { "(gtags)references"},
			d = { "(gtags)define"},
			o = { "(gtags)recall"},
			n = { "(gtags)next"},
			p = { "(gtags)prev"},
			u = { "<cmd>Leaderf gtags --update<cr>"		, "(gtags)update DB" },
		},
		y = { "<cmd>LeaderfFunction<cr>"	, "function"},
		l = { "<cmd>LeaderfLine<cr>"		, "line"},
		q = { "<cmd>LeaderfQuickFix<cr>"	, "quickfix"},
		b = { "<cmd>LeaderfBuffer<cr>"		, "buffer"},
		w = { "<cmd>LeaderfWindow<cr>"		, "window"},
		m = { "<cmd>LeaderfMru<cr>"		, "mru"},
		o = { "<cmd>Leaderf --recall<cr>"	, "recall"},
		g = {
			name = "rg",
		 	l= { "<cmd>Telescope live_grep<cr>"		, "live grep"},
		 	b= { "buffer grep word"},
		 	w= { "global grep word"},
		 	o= { "recall"},
		},
		h = { "<cmd>Telescope help_tags<cr>"		, "help"},
		c = { "<cmd>Telescope commands<cr>"		, "commands"},
		r = { "<cmd>LeaderfHistoryCmd<cr>"		, "commands history"},
		v = { "<cmd>Leaderf floaterm<cr>"		, "floaterm"},
	},
	l = {
		name = "lspsaga",
		f = { "<cmd>Lspsaga lsp_finder<cr>"		, "lsp_finder"},
	},
	v = { "<cmd>Vista!!<cr>", "vista"},
}, { prefix = "<leader>" })

wk.register({
	m = {
		name = "mark",
		m = {"<Plug>MarkSet"			, "mark"},
		r = {"<Plug>MarkRegex"			, "mark by regex"},
		c = {"<cmd>MarkClear<cr>"		, "clear"},
		n = {"<Plug>MarkSearchCurrentNext"	, "current next"},
		p = {"<Plug>MarkSearchCurrentPrev"	, "current prev"},
		j = {"<Plug>MarkSearchAnyNext"		, "any next"},
		k = {"<Plug>MarkSearchAnyPrev"		, "any prev"},
	},
	f = {
		name = "leaderf/telescope",
		g = {
			name = "rg",
			g= { "grep select"},
			b= { "buffer grep word"},
			w= { "global grep word"},
			o= { "recall"},
		},
	},
	h = {
		name = "gitsigns",
		s = "stage hunk",
		r = "reset hunk",
	}
},
{
	prefix = "<leader>",
	mode = "v",
})

wk.register({
	c = {
		name = "comment line",
		c = {"current line"},
	},
	b = {
		name = "comment block",
		c = {"current line"},
	},
}, {
	prefix = "g",
	mode = "n"
})

wk.register({
	u = "lowercase",
	U = "uppercase",
}, {
	prefix = "g",
	mode = "v"
})

wk.register({
	c = "next git hunk"
}, {
	prefix = "]",
	mode = "n"
})

wk.register({
	c = "prev git hunk"
}, {
	prefix = "[",
	mode = "n"
})
