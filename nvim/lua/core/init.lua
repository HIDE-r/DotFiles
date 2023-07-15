-- local disable_distribution_plugins= function()
--   vim.g.loaded_gzip              = 1
--   vim.g.loaded_tar               = 1
--   vim.g.loaded_tarPlugin         = 1
--   vim.g.loaded_zip               = 1
--   vim.g.loaded_zipPlugin         = 1
--   vim.g.loaded_getscript         = 1
--   vim.g.loaded_getscriptPlugin   = 1
--   vim.g.loaded_vimball           = 1
--   vim.g.loaded_vimballPlugin     = 1
--   vim.g.loaded_matchit           = 1
--   vim.g.loaded_matchparen        = 1
--   vim.g.loaded_2html_plugin      = 1
--   vim.g.loaded_logiPat           = 1
--   vim.g.loaded_rrhelper          = 1
--   vim.g.loaded_netrw             = 1
--   vim.g.loaded_netrwPlugin       = 1
--   vim.g.loaded_netrwSettings     = 1
--   vim.g.loaded_netrwFileHandlers = 1
-- end
--
-- local load_core =function()
--   disable_distribution_plugins()
-- end
--
-- load_core()

vim.o.timeoutlen=500
vim.o.showcmd=true

vim.o.splitright=true
vim.o.number=false
vim.o.cursorline=true

-- search
vim.o.hlsearch=true 	-- 高亮搜索
vim.o.incsearch=true 	-- 实时匹配
vim.o.ignorecase=true 	-- 忽略大小写
vim.o.smartcase=true

vim.o.nohlsearch=true

-- 标志栏
vim.o.signcolumn='yes'

-- true color
vim.o.termguicolors=true

-- 显示不可见字符格式，set list打开，set nolist关闭
vim.o.listchars="eol:$,tab:>-,trail:-,extends:>,precedes:<,nbsp:+"

-- 系统粘贴板
vim.o.clipboard=vim.o.clipboard .. "unnamedplus"

-- leader key
vim.g.mapleader=" "
vim.g.maplocalleadhr=','

-- help disable-mouse
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])
