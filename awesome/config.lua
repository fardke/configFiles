local beautiful = require("beautiful")
local gears = require("gears")

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

editor_cmd = terminal .. " -e " .. editor
browser = "firefox"

font = "Inconsolata 11"

modkey = "Mod4"
theme_name = "powerarrow-darker"
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/theme.lua")
for s = 1, screen.count() do
        gears.wallpaper.maximized("/home/kewin/perso/Images/background.jpg", s, true)
end

