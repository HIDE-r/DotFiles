local wezterm = require 'wezterm'

return {
	xcursor_theme="Vimix-cursors",
	color_scheme = "kanagawabones",

	font = wezterm.font_with_fallback {
		{ family="Comic Code", weight="Medium", style=Regular, italic=false },
		-- { family="Operator Mono SSm", weight="Book", style=Book, italic=false },
	},
	font_size = 12.0,

	-- disable ligatures font 
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

	enable_tab_bar = false,
	enable_scroll_bar = false,
	enable_wayland = true,
}
