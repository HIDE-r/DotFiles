 -- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- require('packer').init({
--     git = {
--         default_url_format = 'git@github.com:%s'
--     }
-- })

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Which-key
	use {
		"folke/which-key.nvim",
		config = function()
			require("conf.which-key")
		end
	}

	-- Enhanced matchup(%)
	use {
		'andymass/vim-matchup',
		keys = '%',
		config = function()
			require("conf.matchup")
		end
	}

	-- Enhanced repeat(.)
	-- use {
	-- 	'tpope/vim-repeat',
	-- 	keys = '.',
	-- }

	-- Enhanced f/t/F/T
	-- use {
	-- 	'hrsh7th/vim-eft',
	-- }

	-- Last place
	use {
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup{}
		end
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		run = ':TSUpdate',
	}

	-- Colorscheme

	-- use {
	-- 	'kristijanhusak/vim-hybrid-material',
	-- 	config = function()
	-- 		require("conf.colorscheme.hybrid_material")
	-- 	end
	-- }

	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function ()
	-- 		vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
	-- 		require("catppuccin").setup()
	-- 		vim.api.nvim_command "colorscheme catppuccin"
	-- 	end
	-- })

	use {
		"rebelot/kanagawa.nvim",
		config = function ()
			vim.cmd("colorscheme kanagawa")
		end
	}

	-- use {
	-- 	'glepnir/zephyr-nvim',
	-- 	config = function()
	-- 		require("conf.colorscheme.zephyr")
	-- 	end
	-- }

	-- Dashboard
	-- use {
	-- 	"glepnir/dashboard-nvim",
	-- 	config = function()
	-- 		require("conf.dashboard")
	-- 	end
	-- }

	use {
	    'goolord/alpha-nvim',
	    requires = { 'kyazdani42/nvim-web-devicons' },
	    config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
	    end
	}

	-- Rainbow bracket
	use {
		'p00f/nvim-ts-rainbow',
		after = {'nvim-treesitter'},
		config = function()
			require("conf.treesitter")
		end
	}

	-- use {
	-- 	'luochen1990/rainbow'
	-- }

	-- Bufferline
	-- use {
	-- 	'akinsho/bufferline.nvim',
	-- 	tag = "v2.*",
	-- 	requires = 'kyazdani42/nvim-web-devicons',
	-- 	config = function()
	-- 		require'bufferline'.setup{}
	-- 	end
	-- }

	-- Galaxyline
	-- use {
	-- 	'glepnir/galaxyline.nvim',
	-- 	branch = 'main',
	-- 	requires = {'kyazdani42/nvim-web-devicons'},
	-- 	config = function()
	-- 		require'conf.statusline'
	-- 	end
	-- }

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('conf.lualine')
		end
	}

	-- Indent line
	-- use {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- }

	-- Git
	use {
		'lewis6991/gitsigns.nvim',
		event = {'BufRead','BufNewFile'},
		config = function()
			require('conf.gitsigns')
		end
	}

	-- Comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	-- use {
	-- 	'babaybus/DoxygenToolkit.vim',
	-- 	cmd = {'Dox', 'DoxLic', 'DoxAuthor'},
	-- }

	-- Annotation
	use {
		'danymat/neogen',
		config = function()
			require('neogen').setup {}
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	}

	-- Symbol list
	use {
		'liuchengxu/vista.vim',
		cmd = 'Vista',
	}

	-- Mark
	use {
		'inkarkat/vim-mark',
		requires = {
			{
				'inkarkat/vim-ingo-library',
				-- opt = true,
				branch = 'stable',
				after = {'vim-mark'}
			}
		},
		-- keys = '<leader>m',
		branch = 'stable',
		setup = function()
			require'conf.mark'
		end
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Leader f
	use {
		'Yggdroot/LeaderF',
		run = ':LeaderfInstallCExtension',
	}

	-- Startup time
	use {
		'dstein64/vim-startuptime',
	}

	-- LSP
	use {
	    	"williamboman/mason.nvim",
	    	"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
	}

	use {
		'glepnir/lspsaga.nvim',
		cmd = 'Lspsaga',
		config = function()
			local saga = require 'lspsaga'
			saga.init_lsp_saga()
		end
	}

	use {
		"ray-x/lsp_signature.nvim",
		config = function()
			require("conf.signature")
		end
	}

	-- Snippet Engine
	use {

		'L3MON4D3/LuaSnip',
		-- event = "BufReadPre",
		requires = {
			"rafamadriz/friendly-snippets",
			-- "honza/vim-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			-- require("luasnip.loaders.from_snipmate").lazy_load()
		end
	}

	use {
		'hrsh7th/nvim-cmp',
		-- event = 'InsertEnter',
		requires = {
			{'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig'},
			{'hrsh7th/cmp-path' , after = 'nvim-cmp'},
			{'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
			{'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
			-- {'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp'},
			{'saadparwaiz1/cmp_luasnip', after = "LuaSnip" },
			{'onsails/lspkind.nvim'},
		},
		after = {'lspkind.nvim', "cmp-nvim-lsp", "lsp_signature.nvim"},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("conf.nvim-cmp")
			require("conf.lspconfig")
		end
	}

	-- Remote server clipboard
	use {
		'wincent/vim-clipper',
		disable = true,
	}

	-- Floaterm
	use 'voldikss/vim-floaterm'
	use 'voldikss/LeaderF-floaterm'

	-- Notify
	-- use {
	-- 	'rcarriga/nvim-notify',
	-- 	config = function ()
	-- 		-- local notify = require("notify")
	-- 		-- notify.setup()
	-- 		vim.notify = require("notify")
	-- 	end
	-- }

	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup()
	  	end,
	  	requires = {
	    	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	    		"MunifTanjim/nui.nvim",
	    		"rcarriga/nvim-notify",
	    	}
	})

	-- Tmux
	use({
	    "aserowy/tmux.nvim",
	    config = function()
			require("conf.tmux")
	    end
	})

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})


