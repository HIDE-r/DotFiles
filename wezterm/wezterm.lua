local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.xcursor_theme="Vimix-cursors"

config.colors = {
    ansi = {
        "#1f1f28",
        "#e46a78",
        "#98bc6d",
        "#e5c283",
        "#7eb3c9",
        "#957fb8",
        "#7eb3c9",

-- menuconfig 背景颜色
        "#ddd8bb",
    },
    background = "#1f1f28",
    brights = {
        "#3c3c51",
        "#ec818c",
        "#9ec967",

-- menuconfig 特殊字母颜色
        -- "#f1c982",
        "#c75a22",

        "#7bc2df",
        "#a98fd2",
        "#7bc2df",

-- menuconfig 选中的文字
        -- "#a8a48d",
        "#ffffff",
    },
    cursor_bg = "#e6e0c2",
    cursor_border = "#e6e0c2",
    cursor_fg = "#1f1f28",
    foreground = "#ddd8bb",
    selection_bg = "#49473e",
    selection_fg = "#ddd8bb",
}
-- local scheme = wezterm.color.get_builtin_schemes()['Hacktober']
-- print(scheme)
-- config.color_scheme = "kanagawabones"
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Github Dark (Gogh)'
-- config.color_scheme = 'Hacktober'

config.font = wezterm.font_with_fallback {
	{ family="Comic Code", weight="Medium", style=Regular, italic=false },
	-- { family="MesloLGS NF", style=Regular, italic=false },
	-- { family="Operator Mono SSm", weight="Book", style=Book, italic=false },
}
config.font_size = 12.0

-- Disable ligatures font 
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_wayland = true

-- disable_default_key_bindings = true,
config.keys = {
	{
		key = 'Enter',
		mods = 'ALT',
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.check_for_updates = false
-- config.show_update_window = false

config.front_end="OpenGL"
-- config.front_end="WebGpu"

config.use_ime = true

-- https://github.com/wez/wezterm/issues/3142
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = 'NONE',
		action = wezterm.action.ScrollByLine(-5),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = 'NONE',
		action = wezterm.action.ScrollByLine(5),
	},
}

config.disable_default_key_bindings = true

config.keys = {
	{ key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
	{ key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
	{ key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
	{ key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
	{ key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
	{ key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
	{ key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
	{ key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
	{ key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
	{ key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },

	-- command palette
	{ key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
	{ key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

	-- split
	{ key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
	{ key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

	{ key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
	{ key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },

	{ key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
	{ key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
	{ key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
	{ key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
	{ key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
	{ key = ')', mods = 'CTRL', action = act.ResetFontSize },
	{ key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
	{ key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
	{ key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },

	-- font size
	{ key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
	{ key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },

	{ key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
	{ key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },

	{ key = '0', mods = 'CTRL', action = act.ResetFontSize },
	{ key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },

	{ key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
	{ key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
	{ key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
	{ key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
	{ key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
	{ key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
	{ key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
	{ key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
	{ key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
	{ key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
	{ key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
	{ key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
	{ key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
	{ key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
	{ key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
	{ key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
	{ key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
	{ key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
	{ key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
	{ key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
	{ key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
	{ key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
	{ key = 'M', mods = 'CTRL', action = act.Hide },
	{ key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
	{ key = 'N', mods = 'CTRL', action = act.SpawnWindow },
	{ key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
	{ key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
	{ key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
	{ key = 'T', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
	{ key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
	{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
	{ key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
	{ key = 'W', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
	{ key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
	{ key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
	{ key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
	{ key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
	{ key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
	{ key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
	{ key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
	{ key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
	{ key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
	{ key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
	{ key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
	{ key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
	{ key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
	{ key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
	{ key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
	{ key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
	{ key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
	{ key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
	{ key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
	{ key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
	{ key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
	{ key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
	{ key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
	{ key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
	{ key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
	{ key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
	{ key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
	{ key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
	{ key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
	{ key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
	{ key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
	{ key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
	{ key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
	{ key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
	{ key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
	{ key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
	{ key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
	{ key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
	{ key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
	{ key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
	{ key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
	{ key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' },
	{ key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' },
	{ key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
	{ key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
}

config.key_tables = {
	copy_mode = {
		{ key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
		{ key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
		{ key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
		{ key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
		{ key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
		{ key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
		{ key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
		{ key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
		{ key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
		{ key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
		{ key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
		{ key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
		{ key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
		{ key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
		{ key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
		{ key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
		{ key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
		{ key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
		{ key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
		{ key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
		{ key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
		{ key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
		{ key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
		{ key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
		{ key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
		{ key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
		{ key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
		{ key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
		{ key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
		{ key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
		{ key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
		{ key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
		{ key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
		{ key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
		{ key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
		{ key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
		{ key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
		{ key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
		{ key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
		{ key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
		{ key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
		{ key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
		{ key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
		{ key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
		{ key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
		{ key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
		{ key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
		{ key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
		{ key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
		{ key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
		{ key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
		{ key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
		{ key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
		{ key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
		{ key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
	},

	search_mode = {
		{ key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
		{ key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
		{ key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
		{ key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
		{ key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
		{ key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
		{ key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
		{ key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
		{ key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
		{ key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
	},

}

return config
