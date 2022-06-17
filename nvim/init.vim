
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

let g:Lf_ShortcutF = 0
let g:Lf_ShortcutB = 0
let g:Lf_HideHelp = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_RootMarkers = ['.project', '.git', '.hg', '.svn']

nnoremap <leader>fgb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
xnoremap <leader>fgb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
nnoremap <leader>fgw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
xnoremap <leader>fgw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"" search visually selected text literally
xnoremap <leader>fgg :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
nnoremap <leader>fgo :<C-U>Leaderf! rg --recall<CR>
xnoremap <leader>fgo :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
nnoremap <leader>ftr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <leader>ftd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nnoremap <leader>fto :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
nnoremap <leader>ftn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
nnoremap <leader>ftp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" lua require("conf.lspsaga")
"nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>

   set cscopetag
   set cscopeprg=gtags-cscope
   " cscope database are searched first, if not matches, searched from tag file
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   set csverb
" elseif has("cscope")
"    set cscopetag
"    set csprg=/usr/bin/cscope
"    " cscope database are searched first, if not matches, searched from tag file
"    set csto=0
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"       cs add cscope.out
"    " else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"       cs add $CSCOPE_DB
"    endif
"    set csverb
" endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

nohlsearch
