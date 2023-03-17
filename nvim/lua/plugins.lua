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
			require('kanagawa').setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- Borderless Telescope
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

						-- Dark completion (popup) menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			})

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
		config = true, 
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

		cmd = "Telescope",
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
		config = true, 
	},

	--- Comment
	{
		'numToStr/Comment.nvim',
		keys = { 
			{"gcc","gbc", mode="n"},
			{"gc","gb", mode="v"},
		},
		config = true,
	},

	--- Annotation
	{
		'danymat/neogen',
		cmd = "Neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},

	--- comment label
	{
		"folke/todo-comments.nvim",
		event = 'VeryLazy',
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			signs = false,
		},
	},

	--- zen mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = true, 
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

	{
		'akinsho/toggleterm.nvim',
		cmd = "ToggleTerm",
		keys = { 
			'<C-\\>',
		},
		version = "*",
		init = function()
			function _G.set_terminal_keymaps()
			  local opts = {buffer = 0}
			  -- vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]], opts)
			  vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], opts)
			  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
			  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end,
		opts = {
			open_mapping = [[<C-\>]],
			insert_mappings = true,
			winbar = {
				enabled = true,
			},
		}
	},

	--- color
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = true, 
	},

	{
	  'nvim-tree/nvim-tree.lua',
	  cmd = "NvimTreeToggle",
	  dependencies = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  version = 'nightly', -- optional, updated every week. (see issue #1193)
	  config = true, 
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
