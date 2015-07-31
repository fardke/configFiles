local mymainmenu = require("./menu")
local awful      = require("awful")
local layouts    = require("./layouts")
local tags       = require("./tags")
local naughty    = require("naughty")
local menubar    = require("menubar")
local scratch    = require("scratch")
require("./config")

local keybinds = {}
-- {{{ Key bindings
local keyboards = awful.util.table.join(
    awful.key({ modkey }, "Left",   function() awful.screen.focus_relative(1) end),
    awful.key({ modkey }, "Right",  function() awful.screen.focus_relative(-1) end),
    awful.key({ modkey }, "Escape", awful.tag.history.restore),

    awful.key({ modkey }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift" }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "s", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "s", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),
    awful.key({ modkey, "Control" }, "l",
                function() awful.util.spawn("xscreensaver-command -lock") end),
    awful.key({ modkey }, "p", function() awful.util.spawn("mpc toggle") end),

    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "d", function() menubar.show() end),
    awful.key({ modkey }, "space", function () scratch.drop("urxvt -name scratch", "top", "center", 0.5, 0.35, true) end)
)


-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, #tags do
    keyboards = awful.util.table.join(keyboards,
          awful.key({ modkey }, "#" .. i + 9,
                    function ()
                            tag = tags[i][1]
                            if tag then
                                   awful.tag.viewonly(tag)
                                   screen = awful.tag.getscreen(tag)
                                   awful.screen.focus(screen)
                            end
                    end),
          awful.key({ modkey, "Control" }, "#" .. i + 9,
                    function ()
                            if tags[i][1] then
                                   awful.tag.viewtoggle(tags[i][1])
                            end
                    end),
          awful.key({ modkey, "Shift" }, "#" .. i + 9,
                    function ()
                           if client.focus and tags[i][1] then
                                   awful.client.movetotag(tags[i][1])
                           end
                    end),
          awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                    function ()
                           if client.focus and tags[client.focus.screen][i] then
                                   awful.client.toggletag(tags[client.focus.screen][i])
                           end
                    end)
)
end


local clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)


local mouse = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


keybinds.mouse = mouse
keybinds.clientkeys = clientkeys
keybinds.keyboards = keyboards

return keybinds
