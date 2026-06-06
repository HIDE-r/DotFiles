local terminal    = "wezterm start"
local fileManager = "nemo"

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output   = "eDP-1",
	mode     = "preferred",
	position = "auto",
	scale    = "1.07",
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	xwayland = {
		force_zero_scaling = true
	},
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding       = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled      = true,
			range        = 4,
			render_power = 3,
			color        = 0xee1a1a1a,
		},

		blur = {
			enabled   = true,
			size      = 3,
			passes    = 1,
			vibrancy  = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout  = "us",
		kb_variant = "",
		kb_model   = "",
		kb_options = "",
		kb_rules   = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name        = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({mode = "maximized"}))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float())
-- pins a window , floating only
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- bind = $mainMod, O, pseudo, # dwindle
-- # bind = $mainMod, R, togglesplit,

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("rofi -show window"))

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("copyq show"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("copyq edit -1"))

-- hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("copyq clipboard | xargs goldendict"))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("curl http://127.0.0.1:60828/translate"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("wayle panel toggle"))

-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("env XDG_CURRENT_DESKTOP=Hyprland flameshot gui"))

hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("wezterm --config enable_wayland=false start xdotool key super+alt+c"))
-- hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("dunstctl history-pop"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
	hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous"}))
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "e-1"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "e+1"}))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + grave",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86Calculator", hl.dsp.exec_cmd("kcalc"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("CTRL + ALT_R", hl.dsp.submap("passthrough"))
-- Start a submap called "resize".
hl.define_submap("passthrough", function()
    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))

end)

-- Keybinds further down will be global again...
-- Passthrough key to remote desktop
-- bind = CTRL , Alt_R, submap, passthrough
-- submap = passthrough
-- bind = CTRL , Alt_R, submap, reset
-- submap = reset

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name  = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

hl.window_rule ({
	name = "unlocked-prompt",
	match = {
		class = "^gcr-prompter$"
	},

	pin = true,
	stay_focused = true,
})

hl.window_rule({
	name  = "hypridle",
	match = { class = ".*" },

	idle_inhibit = "fullscreen",
})

hl.window_rule({
	name  = "copyq",
	match = { class = ".*copyq$" },

	float  = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "pot",
	match = { class = "pot" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "goldendict",
	match = { class = ".*GoldenDict-ng$" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "nemo",
	match = { class = "nemo" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "kcalc",
	match = { class = "org.kde.kcalc" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "keycombiner",
	match = { class = "keycombiner" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "authentication-agent",
	match = { class = "org.kde.polkit-kde-authentication-agent-1" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "xdg-desktop-portal-gtk" },

	float = true,
	center = true,
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	name = "obsidian",
	match = { class = "obsidian" },

	workspace = "8 silent"
})

hl.window_rule({
	name = "peek",
	match = { class = "Peek" },

	no_blur = true
})

hl.window_rule({
	name = "drawpen",
	match = { class = "DrawPen" },

	no_blur = true
})

-- https://github.com/hyprwm/Hyprland/issues/6140#issuecomment-2323146497
hl.window_rule({
	name = "looking-glass",
	match = { class = "looking-glass-client" },

	render_unfocused = true
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Nvidia
-- env = WLR_NO_HARDWARE_CURSORS,1

-- wlroots Variables
hl.env("HYPRLAND_LOG_WLR", "1")

-- Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- Fcitx Variables
-- hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")

-- Electron Variables
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Cursor Variables
hl.env("GDK_SCALE", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Vimix-cursors")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("hyprctl setcursor Vimix-cursors 24")
	hl.exec_cmd("xsetroot -xcf /usr/share/icons/Vimix-cursors/cursors/left_ptr 24")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

	hl.exec_cmd(terminal)
	hl.exec_cmd("wayle panel start  & variety & obsidian & udiskie & pot & copyq & blueman-applet")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("~/.local/bin/sync_fcitx5.sh")
	hl.exec_cmd("~/.local/bin/server_notify -l")
end)
