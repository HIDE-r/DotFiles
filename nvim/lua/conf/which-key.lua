local wk = require("which-key")

wk.register({
	r = {
		name = "reload/resume",
		c = { "<cmd>source $MYVIMRC<cr>"	, "vimrc" },
		h = { "<cmd>nohlsearch<cr>"		, "nohlsearch" },
		l = { "<cmd>set list!<cr>"		, "list mode" },
	},
	d = {
		name = "doxygen",
		d = { "<cmd>Dox<cr>"		, "doc"},
		l = { "<cmd>DoxLic<cr>"		, "license"},
		a = { "<cmd>DoxAuthor<cr>"	, "author"},
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
}, 
{ 
	prefix = "<leader>",
	mode = "v",
})

-- wk.register({
-- 	c = { 
-- 		name = "comment line",
-- 		c = {"current line"},
-- 	},
-- 	b = {
-- 		name = "comment block",
-- 		c = {"current line"},
-- 	},
-- }, { 
-- 	prefix = "g",
-- 	mode = "n"
-- })
