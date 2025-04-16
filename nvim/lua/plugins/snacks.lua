return {
	'folke/snacks.nvim',
	opts = {
		picker = {},
	},
	keys = {
		{ "<leader>fa", function() Snacks.picker.autocmds() end, desc = "[snacks.picker] Autocmds" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "[snacks.picker] Help Pages" },
		{ "<leader>fk", function() Snacks.picker.keymaps() end, desc = "[snacks.picker] Keymaps" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "[snacks.picker] Find Files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "[snacks.picker] Buffers" },
		{ "<leader>fc", function() Snacks.picker.command_history() end, desc = "[snacks.picker] Command History" },
		{ "<leader>fC", mode = { "n", "v" }, function() Snacks.picker.commands() end, desc = "[snacks.picker] Commands" },
		{ "<leader>fn", function() Snacks.picker.notifications() end, desc = "[snacks.picker] Notification History" },
		{ "<leader>fm", function() Snacks.picker.man() end, desc = "[snacks.picker] Man Pages" },
		{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "[snacks.picker] Todo" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "[snacks.picker] Recent" },
		{ "<C-o>", function() Snacks.picker.jumps() end, desc = "[snacks.picker] Jumps" },
		{ "'", function() Snacks.picker.marks() end, desc = "[snacks.picker] Marks" },

		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "[snacks.picker] Buffer Lines" },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "[snacks.picker] Grep Open Buffers" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "[snacks.picker] Grep" },
		{ "<leader>sR", function() Snacks.picker.resume() end, desc = "[snacks.picker] Resume" },
	},
}
