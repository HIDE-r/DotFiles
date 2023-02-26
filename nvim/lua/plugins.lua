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
		lazy = false,
		priority=1000,
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
		event = {'BufRead','BufNewFile'},
		config = function()
			require('conf.gitsigns')
		end
	},

	{
		'sindrets/diffview.nvim',
		enabled = false,
		dependencies = 'nvim-lua/plenary.nvim',
	},

	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require("conf.dashboard")
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	--- matchup
	{
		'andymass/vim-matchup',
		event = {'BufRead','BufNewFile'},
		init = function()
			vim.g.matchup_matchparen_enabled = 0
			vim.g.matchup_matchparen_offscreen = {}
		end
	},

	--- mark
	{
		'inkarkat/vim-mark',
		event = "VeryLazy",
		dependencies = {
			{
				'inkarkat/vim-ingo-library',
				branch = 'stable',
			}
		},
		branch = 'stable',
		init = function()
			vim.g.mw_no_mappings = 1
			vim.g.mwDefaultHighlightingPalette = 'extended'
			vim.g.mwDefaultHighlightingNum = 10
		end
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',

		event = "VeryLazy",
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim', 
				build = 'make',
			},
			'tom-anders/telescope-vim-bookmarks.nvim',
		},
		config = function()
			require('telescope').load_extension('vim_bookmarks')
		end
	},

	--- symbol list
	{
		'liuchengxu/vista.vim',
		cmd = 'Vista',
	},

	--- tmux
	{
		"aserowy/tmux.nvim",
		event = "VeryLazy",
		config = function()
			require("conf.tmux")
		end
	},

	{
		"dstein64/vim-startuptime",
		enabled = false,
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
		cmd = "Neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require('neogen').setup {}
		end,
	},

	--- comment label
	{
		"folke/todo-comments.nvim",
		event = 'VeryLazy',
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

	{
		'kevinhwang91/nvim-ufo',
		dependencies = {
			'kevinhwang91/promise-async',
			'neovim/nvim-lspconfig',
			'nvim-treesitter/nvim-treesitter'
		},
		config = function()
			require("conf.ufo")
		end
	},

	-- quickfix window
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			{
				'junegunn/fzf', 
				build = function()
					vim.fn['fzf#install']()
				end
			},
		},
	},

	--- Remote server clipboard
	{
		'wincent/vim-clipper',
		cmd="Clip",
		init = function()
			vim.g.ClipperMap=0
		end
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
		'MattesGroeger/vim-bookmarks',
		event = 'VeryLazy',
		init = function()
			vim.g.bookmark_no_default_key_mappings = 1
		end,
	},


	--- float term
	{
		'voldikss/vim-floaterm',
		-- 'voldikss/LeaderF-floaterm',
		keys = {
			"<F8>", "<F11>",
		},
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
		cmd = "ColorizerToggle",
		config = function()
			require'colorizer'.setup()
		end
	},

	{
	  'nvim-tree/nvim-tree.lua',
	  cmd = "NvimTreeToggle",
	  dependencies = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  version = 'nightly', -- optional, updated every week. (see issue #1193)
	  config = function()
		  require("nvim-tree").setup()
	  end,
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require("conf.treesitter")
		end
	},

	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter',
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
		lazy = 1,
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
		event = "VeryLazy",
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
