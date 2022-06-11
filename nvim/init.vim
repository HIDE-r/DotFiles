
set timeoutlen=500     " 在按下leader后，当timeoutlen内没有进一步按键时，which-key将会弹出
set showcmd            " 显示输入的命令

" 搜索高亮相关设置
set hlsearch		"高亮搜索
set incsearch		"实时匹配
set ignorecase      	"忽略大小写
set smartcase

let mapleader="\<Space>"      " 修改leader键,默认为“\”
let maplocalleader=',' " 设置local leader

" ture color
set termguicolors       

" 显示不可见字符格式，set list打开，set nolist关闭
set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<,nbsp:+

set completeopt=menu,menuone,noselect

lua require("core")
lua require('plugins')


let g:matchup_matchparen_offscreen = {'scrolloff': '1'}
let g:matchup_matchparen_enabled = 0

" lua require("conf.lspsaga")
"nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>

nohlsearch
