local kopts = {noremap = true, silent = true}

-- [2/6] 意思是目前位于匹配单词的第二个, 总数有六个
-- [N 1] 意思是输入 N 可以到这个单词, 这个是匹配单词中的第一个

return {
	{
		"kevinhwang91/nvim-hlslens",
		keys = {
			{
				"/",
				mode = {'n'},
				desc = "Search",
			},
			{
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], 
 				mode = {'n'},
				desc = "[nvim-hlslens] Next Hls",
				kopts,
			},
			{
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				mode = {'n'},
				desc = "[nvim-hlslens] Prev Hls",
				kopts,
			},
			{
				"*",
				[[*<Cmd>lua require('hlslens').start()<CR>]],
				mode = {'n'},
				desc = "[nvim-hlslens] Next Hls",
				kopts,
			},
			{
				"#",
				[[#<Cmd>lua require('hlslens').start()<CR>]],
				mode = {'n'},
				desc = "[nvim-hlslens] Prev Hls",
				kopts,
			},
			{
				"g*",
				[[g*<Cmd>lua require('hlslens').start()<CR>]],
				mode = {'n'},
				desc = "[nvim-hlslens] Next Hls",
				kopts,
			},
			{
				"g#",
				[[g#<Cmd>lua require('hlslens').start()<CR>]],
				mode = {'n'},
				desc = "[nvim-hlslens] Prev Hls",
				kopts,
			},
		},
		opts = {},
	},
}

