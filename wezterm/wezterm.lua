local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.xcursor_theme="Vimix-cursors"
config.color_scheme = "kanagawabones"

config.font = wezterm.font_with_fallback {
	{ family="Comic Code", weight="Medium", style=Regular, italic=false },
	{ family="MesloLGS NF", style=Regular, italic=false },
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
config.show_update_window = false

config.front_end="OpenGL"

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

return config
