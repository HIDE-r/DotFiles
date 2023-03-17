local wk = require("which-key")

-- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
wk.setup {
}


-- <leader>

wk.register({
	r = {
		name = "reload/resume",
		s = { "<cmd>set hlsearch!<cr>"		, "highlight search" },
		l = { "<cmd>set list!<cr>"		, "list mode" },
		n = { "<cmd>set number!<cr>"		, "line number" },
		c = { "<cmd>ColorizerToggle<cr>"	, "color" },
	},
	m = {
		name = "mark",
		m = {"<Plug>MarkSet"			, "mark"},
		r = {"<Plug>MarkRegex"			, "mark by regex"},
		c = {"<cmd>MarkClear<cr>"		, "clear"},
	},
	p = {
		name = "lazy",
		l = { "<cmd>Lazy show<cr>"		, "status"},
		s = { "<cmd>Lazy sync<cr>"		, "sync"},
		p = { "<cmd>Lazy profile<cr>"		, "profile"},
	},
	d = {
		name = "neogen",
		d = { "<cmd>Neogen<cr>"		, "annotation"},
	},
	-- d = {
	-- 	name = "doxygen",
	-- 	d = { "<cmd>Dox<cr>"		, "doc"},
	-- 	l = { "<cmd>DoxLic<cr>"		, "license"},
	-- 	a = { "<cmd>DoxAuthor<cr>"	, "author"},
	-- },
	v = { "<cmd>Vista!!<cr>", "vista"},
	z = { "<cmd>ZenMode<cr>", "zen mode"},
}, { 
	prefix = "<leader>",
	mode = {"n", "v"}
})

wk.register({
	m = {
		name = "mark",
		n = {"<Plug>MarkSearchCurrentNext"	, "current next"},
		p = {"<Plug>MarkSearchCurrentPrev"	, "current prev"},
		j = {"<Plug>MarkSearchAnyNext"		, "any next"},
		k = {"<Plug>MarkSearchAnyPrev"		, "any prev"},
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
		D = "diff with commit",
		d = "diff with stage",
		t = {
			name = "toggle",
			b = "show line blame",
			d = "show delete content"
		}
	},
	f = {
		name = "leaderf/telescope",
		f = { "<cmd>Telescope find_files<cr>"		, "files"},
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
		b = { "<cmd>Telescope buffers<cr>"	, "buffer"},
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
		r = { "<cmd>Telescope command_history<cr>"	, "commands history"},
		v = { "<cmd>Leaderf floaterm<cr>"		, "floaterm"},
		d = { "<cmd>TodoTelescope<cr>"			, "todo"},
		["'"] = { "<cmd>Telescope marks<cr>"		, "mark"}
	},
	l = {
		name = "lsp",
		d = {
			name = "diagnostic",
		 	d= { "open diagnostic"},
		 	n= { "next diagnostic"},
		 	p= { "prev diagnostic"},
		 	l= { "list"},
		 	t= { "toggle diagnostic"},
		 	s= { "show diagnostic"},
		 	h= { "hide diagnostic"},
		},
		w = {
			name = "workspace",
		 	a= { "add workspace"},
		 	r= { "remove workspace"},
		 	l= { "list workspace"},
		},
		g = {
			name = "goto",
		 	D= { "declaration"},
		 	d= { "definition"},
		 	i= { "implementation"},
			r= { "references"},
			t= { "type definition"},
		},
		k= { "hover"},
		h= { "signature help"},
		f= { "format"},
		r= { "rename"},
		a= { "code action"},
		s= { "<cmd>LspStart<cr>", "start"},
	},
	g = {
		name = "lspsaga",
		h = { "<cmd>Lspsaga lsp_finder<cr>"		, "symbol's definition"},
		d = { "<cmd>Lspsaga peek_definition<cr>"	, "definition"},
		t = { "<cmd>Lspsaga peek_type_definition<cr>"	, "type definition"},
	},
	b = {
		name = "bookmark",
		m = {"<Plug>BookmarkToggle" 			, "[bookmark] toggle"},
		i = {"<Plug>BookmarkAnnotate" 			, "[bookmark] annotate"},
		a = {"<cmd>Telescope vim_bookmarks all<cr>" 	, "[bookmark] show all mark"},
		n = {"<Plug>BookmarkNext" 			, "[bookmark] next mark"},
		p = {"<Plug>BookmarkPrev" 			, "[bookmark] prev mark"},
		c = {"<Plug>BookmarkClear" 			, "[bookmark] clear current buffer mark"},
		x = {"<Plug>BookmarkClearAll" 			, "[bookmark] clear all buffer mark"},
		j = {"<Plug>BookmarkMoveDown" 			, "[bookmark] move down"},
		k = {"<Plug>BookmarkMoveUp" 			, "[bookmark] move up"},
		g = {"<Plug>BookmarkMoveToLine" 		, "[bookmark] move to line"},
	},
	e = {
		name = "File Explorer",
		e = {"<cmd>NvimTreeToggle<cr>" 	, "[nvim-tree] toggle"},
		f = {"<cmd>NvimTreeFindFile<cr>", "[nvim-tree] find file"},
	},
	y = {"<cmd>Clip<cr>", "sync clipboard"},
}, { 
	prefix = "<leader>",
	mode = "n",
})

wk.register({
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
		name = "(Comment)comment line",
		c = {"(Comment)current line"},
	},
	b = {
		name = "(Comment)comment block",
		c = {"(Comment)(current line"},
	},
}, {
	prefix = "g",
	mode = "n"
})

wk.register({
	u = "lowercase",
	U = "uppercase",
	c = "[Comment] select line",
	b = "[Comment] select ",
	["%"] = "[matchup] select to boundary"
}, {
	prefix = "g",
	mode = "v"
})

wk.register({
	c = "next git hunk",
	d = "next diagnostic"
}, {
	prefix = "]",
	mode = "n"
})

wk.register({
	c = "prev git hunk",
	d = "prev diagnostic"
}, {
	prefix = "[",
	mode = "n"
})

wk.register({
	["<F8>"] = "[floaterm] new",
	["<F9>"] = "[floaterm] prev",
	["<F10>"] = "[floaterm] next",
	["<F11>"] = "[floaterm] toggle",
	["<C-H>"] = "[tmux] move left",
	["<C-J>"] = "[tmux] move down",
	["<C-K>"] = "[tmux] move up",
	["<C-L>"] = "[tmux] move right",
	["<M-h>"] = "[tmux] resize left",
	["<M-j>"] = "[tmux] resize down",
	["<M-k>"] = "[tmux] resize up",
	["<M-l>"] = "[tmux] resize right",
	["<2-LeftMouse>"] = "[matchup] visual select area",
}, {
	mode = "n"
})

