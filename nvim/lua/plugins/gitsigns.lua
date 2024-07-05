return {
	{
		'lewis6991/gitsigns.nvim',
		event = {'BufRead','BufNewFile'},
		opts = {
			signs = {
				add          = { text = '│' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
			numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = 'single',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, {expr=true, desc = "[gitsigns] next hunk"})

				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, {expr=true, desc = "[gitsigns] prev hunk"})

				-- Actions
				map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "[gitsigns] reset hunk" })
				map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "[gitsigns] stage hunk" })
				map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "[gitsigns] reset hunk" })

				map('n', '<leader>hS', gs.stage_buffer, { desc = "[gitsigns] stage buffer" })
				map('n', '<leader>hR', gs.reset_buffer, { desc = "[gitsigns] reset buffer" })

				map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "[gitsigns] undo stage hunk" })
				map('n', '<leader>hp', gs.preview_hunk, { desc = "[gitsigns] preview hunk" })
				map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "[gitsigns] blame line" })
				map('n', '<leader>htb', gs.toggle_current_line_blame, { desc = "[gitsigns] toggle blame" })
				map('n', '<leader>hd', gs.diffthis, { desc = "[gitsigns] diff" })
				map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "[gitsigns] diff hunk" })
				map('n', '<leader>htd', gs.toggle_deleted, { desc = "[gitsigns] toggle deleted" })

				-- Text object
				map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "[gitsigns] select hunk" })

				map('n', '<leader>hc', "<Cmd>Telescope git_commits<CR>", { desc = "[telescope] git commits" })
				map('n', '<leader>hl', "<Cmd>Telescope git_status<CR>", { desc = "[telescope] git status" })
			end

		},
	},
}
