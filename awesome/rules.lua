local awful     = require("awful")
local beautiful = require("beautiful")
local keybinds  = require("./keybinding")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
        {
                rule = { },
                properties = {
                        border_width = beautiful.border_width,
                        border_color = beautiful.border_normal,
                        focus = awful.client.focus.filter,
                        raise = true,
                        keys = keybinds.clientkeys,
                        buttons = keybinds.mouse
                }
        },
        {
                rule = {
                        class = "MPlayer"
                },
                properties = {
                        floating = true
                }
        },
        {
                rule = {
                        class = "pinentry"
                },
                properties = {
                        floating = true
                }
        },
        {
                rule = {
                        class = "gimp"
                },
                properties = {
                        floating = true
                }
        },
        {
                rule = {
                        name = "ncmpcpp"
                },
                properties = {
                        tag = tags[5][1],
                        floating = true
                }
        },
        {
                rule = {
                        name = "laptop"
                },
                properties = {
                        tag = tags[1][1]
                }
        },
}
-- }}}


