return {
	{

		'L3MON4D3/LuaSnip',
		lazy = true,
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- "honza/vim-snippets",
		},
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			-- require("luasnip.loaders.from_snipmate").lazy_load()
		end
	},

	{
		'hrsh7th/nvim-cmp',
		-- enabled = false,
		event = "BufRead",
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
			--[[ 
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end 
			]]

			local luasnip = require("luasnip")
			local cmp = require'cmp'
			local lspkind = require('lspkind')

			local opts = {
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},

				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					-- ['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
							-- elseif has_words_before() then
							-- 	cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources(
				{
					{ name = "copilot" },
					{ name = 'nvim_lsp' },
					-- { name = 'vsnip' }, -- For vsnip users.
					{ name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				},
				{
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'buffer' },
					{ name = 'path' },
				}),

				formatting = {
					format = lspkind.cmp_format({
						-- mode = 'symbol', -- show only symbol annotations
						mode = "symbol_text",
						maxwidth = 50, -- prevent the popup from showing more than provided characters
						menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						}),
						symbol_map = { Copilot = "" }
					}),
				},
			}

			cmp.setup(opts)
		end
	},
}
