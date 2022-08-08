local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local menubar = require("menubar")

local apps = require("configuration.apps")

menubar.utils.terminal = apps.default.terminal -- Set the terminal for applications that require it

local editor_cmd = apps.default.terminal .. " -- " .. apps.default.editor

local awesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

return {
	items = {
		{ "awesome", awesomemenu, beautiful.awesome_icon },
		{ "open terminal", apps.default.terminal }
	}
}
