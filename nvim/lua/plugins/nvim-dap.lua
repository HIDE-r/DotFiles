return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')

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
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", 'nvim-neotest/nvim-nio' },
		opts = {},
	},
}
