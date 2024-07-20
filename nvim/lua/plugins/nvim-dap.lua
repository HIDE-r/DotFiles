return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require('dap')
			local icons = {
				Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint          = " ",
				BreakpointCondition = " ",
				BreakpointRejected  = { " ", "DiagnosticError" },
				LogPoint            = ".>",
			}

			for name, sign in pairs(icons) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
				)
			end

			dap.adapters.cppdbg = {
				id = 'cppdbg',
				type = 'executable',
				command = '/home/collin/.local/share/nvim/mason/bin/OpenDebugAD7',
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopAtEntry = true,
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'cppdbg',
					request = 'launch',
					MIMode = 'gdb',
					miDebuggerServerAddress = 'localhost:1234',
					miDebuggerPath = '/usr/bin/gdb',
					cwd = '${workspaceFolder}',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		enabled = false,
		dependencies = {
			"mfussenegger/nvim-dap",
			{"nvim-treesitter/nvim-treesitter", build = ':TSUpdate'},
		},
		opts = {
			-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
			virt_text_pos = 'eol',
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", 'nvim-neotest/nvim-nio' },
		keys = {
			{
				"<localleader>r",
				function() require'dap'.continue() end,
 				mode = {'n'},
				desc = "[dap] run",
			},
			{
				"<localleader>s",
				function() require'dap'.step_into() end,
 				mode = {'n'},
				desc = "[dap] step",
			},
			{
				"<localleader>n",
				function() require'dap'.step_over() end,
 				mode = {'n'},
				desc = "[dap] next",
			},
			{
				"<localleader>b",
				function() require'dap'.toggle_breakpoint() end,
 				mode = {'n'},
				desc = "[dap] breakpoint",
			},
			{
				"<localleader>b",
				function() require'dap'.toggle_breakpoint() end,
 				mode = {'n'},
				desc = "[dap] breakpoint",
			},
			{
				"<localleader>`",
				function() require'dap'.repl.toggle() end,
 				mode = {'n'},
				desc = "[dap] REPL",
			},
			{
				"<localleader>q",
				function()
					require'dap'.disconnect()
					require'dap'.close()
					require'dapui'.close()
				end,
 				mode = {'n'},
				desc = "[dap] quit",
			},
		},
		opts = {},
		config = function(_, opts)
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			require("dapui").setup(opts)
		end
	},
}
