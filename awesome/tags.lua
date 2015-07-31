local awful = require("awful")

tags = {
        awful.tag({"1: laptop"}, 1, awful.layout.suit.fair),
        awful.tag({"2: dev"}, screen.count(), awful.layout.suit.max),
        awful.tag({"3: web"}, 1, awful.layout.suit.max),
        awful.tag({"4: webp"}, 1, awful.layout.suit.max),
        awful.tag({"5: utils"}, screen.count(), awful.layout.suit.floating),
}

return tags
