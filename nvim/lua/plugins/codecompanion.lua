local openrouter_models = {
	["anthropic/claude-haiku-4.5"] = {
		formatted_name = "Claude Haiku 4.5",
		opts = {
			can_form_structured_outputs = true,
			can_use_tools = false,
			has_vision = false,
			supported_parameters = {},
		},
	},
	["openai/gpt-5.4-mini"] = {
		formatted_name = "GPT-5.4 mini",
		opts = {
			can_form_structured_outputs = true,
			can_use_tools = false,
			has_vision = false,
			supported_parameters = {},
		},
	},
}

local function disable_dynamic_parameter()
	return {
		enabled = function()
			return false
		end,
	}
end

return {
	{
		"olimorris/codecompanion.nvim",
		cmd = {
			"CodeCompanion",
			"CodeCompanionActions",
			"CodeCompanionChat",
			"CodeCompanionCLI",
			"CodeCompanionCmd",
			"CodeCompanionCodeReview",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"lalitmee/codecompanion-spinners.nvim",
		},
		opts = {
			-- NOTE: The log_level is in `opts.opts`
			-- opts = {
			-- 	log_level = "DEBUG", -- or "TRACE"
			-- },
			adapters = {
				http = {
					-- The stock OpenRouter adapter waits only three seconds for its
					-- remote model catalogue. These interactions use fixed models, so
					-- keep their capabilities local and skip that discovery request.
					openrouter_fixed = function()
						return require("codecompanion.adapters").extend("openrouter", {
							schema = {
								model = {
									default = "openai/gpt-5.4-mini",
									choices = openrouter_models,
								},
								["reasoning.effort"] = disable_dynamic_parameter(),
								temperature = disable_dynamic_parameter(),
								top_p = disable_dynamic_parameter(),
								top_k = disable_dynamic_parameter(),
								min_p = disable_dynamic_parameter(),
								stop = disable_dynamic_parameter(),
								presence_penalty = disable_dynamic_parameter(),
								frequency_penalty = disable_dynamic_parameter(),
							},
						})
					end,
				},
				acp = {
					codex = function()
						return require("codecompanion.adapters").extend("codex", {
							defaults = {
								auth_method = "chat-gpt",
							},
							env = {
								CODEX_PATH = "/usr/bin/codex",
							},
							handlers = {
								-- Codex CLI is already authenticated via `codex login`.
								-- Avoid concurrent ACP auth requests when a chat is submitted
								-- before CodeCompanion's background connection is ready.
								auth = function()
									return true
								end,
							},
						})
					end,
				},
			},
			interactions = {
				background = {
					-- Use a small HTTP model for automatic titles and other
					-- non-interactive helper requests.
					adapter = {
						name = "openrouter_fixed",
						model = "openai/gpt-5.4-mini",
					},
					chat = {
						opts = {
							enabled = true,
						},
					},
					gates = {
						judge = {
							enabled = false,
						},
					},
				},
				chat = {
					adapter = "codex",
				},
				inline = {
					adapter = {
						name = "openrouter_fixed",
						model = "anthropic/claude-haiku-4.5",
					},
				},
				cmd = {
					adapter = {
						name = "openrouter_fixed",
						model = "anthropic/claude-haiku-4.5",
					},
				},
				cli = {
					agent = "codex",
					agents = {
						codex = {
							cmd = "/usr/bin/codex",
							args = {},
							description = "OpenAI Codex CLI",
							provider = "terminal",
						},
					},
				},
			},
			extensions = {
				spinner = {
					opts = {
						-- style = "cursor-relative", -- 跟随光标
						style = "lualine",            -- 状态栏
						["cursor-relative"] = {
							text = "",
							hl_positions = { { 0, 3 }, { 3, 6 }, { 6, 9 } },
							interval = 100,
							hl_group = "Title",
							hl_dim_group = "NonText",
						},
					},
				},
			},
		},
		-- config = function (_,opts)
		-- 	vim.cmd([[cab cc CodeCompanion]])
		-- end
	}
}
