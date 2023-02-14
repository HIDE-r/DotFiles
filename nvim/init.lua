vim.o.timeoutlen=500
vim.o.showcmd=true

vim.o.splitright=true
vim.o.number=false

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

-- leader key
vim.g.mapleader=" "
vim.g.maplocalleadhr=','

require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/which-key.nvim",
		config = function()
			require("conf.which-key")
		end
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons'},
		config = function()
			require('conf.lualine')
		end
	},
	{
		'akinsho/bufferline.nvim', 
		version = "v3.*", 
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup{}
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		-- event = {'BufRead','BufNewFile'},
		config = function()
			require('conf.gitsigns')
		end
	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	},

	--- matchup
	{
		'andymass/vim-matchup',
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "" }
		end
	},

	--- mark
	{
		'inkarkat/vim-mark',
		dependencies = {
			{
				'inkarkat/vim-ingo-library',
				branch = 'stable',
			}
		},
		branch = 'stable',
		init = function()
			require'conf.mark'
		end
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim', 
			build = 'make',
		},

		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

	--- symbol list
	{
		'liuchengxu/vista.vim',
		cmd = 'Vista',
	},

	--- tmux
	{
		"aserowy/tmux.nvim",
		config = function()
			require("conf.tmux")
		end
	},

	{
		"dstein64/vim-startuptime",
		enabled = false,
		lazy = true,
		cmd = "StartupTime",
	},

	--- lastplace
	{
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup{}
		end
	},

	--- Comment
	{
		'numToStr/Comment.nvim',
		keys = { 
			{"gcc","gbc", mode="n"},
			{"gc","gb", mode="v"},
		},
		config = function()
			require('Comment').setup()
		end
	},

	--- Annotation
	{
		'danymat/neogen',
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require('neogen').setup {}
		end,
	},

	--- comment label
	{
		"folke/todo-comments.nvim",
	  	dependencies = "nvim-lua/plenary.nvim",
	  	config = function()
	  	  require("todo-comments").setup {
			  signs = false,
		  }
	  	end
	},

	--- zen mode
	{
	  	"folke/zen-mode.nvim",
		cmd = "ZenMode",
	  	config = function()
	  	  require("zen-mode").setup {}
	  	end
	},

	--- Remote server clipboard
	{
		'wincent/vim-clipper',
		enabled = false,
	},

	--- noice
	{
		"folke/noice.nvim",
	  	dependencies = {
	    		"MunifTanjim/nui.nvim",
	    		"rcarriga/nvim-notify",
	    	},
		config = function()
			require("noice").setup({
				lsp = {
					signature = {
						enabled = false,
					}
				}
			})
	  	end
	},

	{
		{
			'MattesGroeger/vim-bookmarks',
			init = function()
				vim.g.bookmark_no_default_key_mappings = 1
			end,
		},
		'tom-anders/telescope-vim-bookmarks.nvim',
		config = function()
			require('telescope').load_extension('vim_bookmarks')
		end
	},


	--- float term
	{
		'voldikss/vim-floaterm',
		-- 'voldikss/LeaderF-floaterm',
		init = function()
			vim.g.floaterm_keymap_new = '<F8>'
			vim.g.floaterm_keymap_prev = '<F9>'
			vim.g.floaterm_keymap_next = '<F10>'
			vim.g.floaterm_keymap_toggle = '<F11>'
		end
	},

	--- color
	{
		"norcalli/nvim-colorizer.lua",
		enabled = false,
		init = function()
			require'colorizer'.setup()
		end
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require("conf.treesitter")
		end
	},

	-- LSP
	{
		"williamboman/mason-lspconfig.nvim", 
		dependencies = "williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
		end
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("conf.signature")
		end
	},

	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{"nvim-tree/nvim-web-devicons"},
			--Please make sure you install markdown and markdown_inline parser
			{"nvim-treesitter/nvim-treesitter"}
		}
	},

	-- Snippet Engine
	{

		'L3MON4D3/LuaSnip',
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- "honza/vim-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			-- require("luasnip.loaders.from_snipmate").lazy_load()
		end
	},

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp', dependencies = 'nvim-lspconfig'},
			{'hrsh7th/cmp-path' },
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-cmdline'},
			{'onsails/lspkind.nvim'},
			-- {'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp'},
			{'saadparwaiz1/cmp_luasnip', dependencies = "LuaSnip" },
		},
		config = function()
			require("conf.nvim-cmp")
			require("conf.lspconfig")
		end
	},
})
