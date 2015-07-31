local awful = require("awful")
local beautiful = require("beautiful")
require("./config")

-- {{{ Menu
-- Create a laucher widget and a main menu
local myawesomemenu = {
        { "manual", terminal .. " -e man awesome" },
        { "edit config", editor_cmd .. " " .. awesome.conffile },
        { "restart", awesome.restart },
        { "quit", awesome.quit }
}

local mymainmenu = awful.menu({
        items = {
                { "awesome", myawesomemenu, beautiful.awesome_icon },
                { "Firefox", "firefox"},
                { "Chromium", "chromium"},
                { "uzbl", "uzbl-browser"},
                { "open terminal", terminal }
        }
})
return mymainmenu

