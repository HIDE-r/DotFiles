
set timeoutlen=500     " 在按下leader后，当timeoutlen内没有进一步按键时，which-key将会弹出
set showcmd            " 显示输入的命令
set splitright         " 分屏时新窗口在右边

set signcolumn=yes     " 左侧标志栏

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


let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['Silver', 'IndianRed', 'darkcyan', 'gray' , '#9999FF', '#65934a', '#8CCBEA'],
\	'ctermfgs': ['gray', 'brown', 'lightblue', 'lightyellow', 'darkgreen', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {},
\		'css': 0,
\	}
\}

" lua require("conf.lspsaga")
"nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>

nohlsearch
