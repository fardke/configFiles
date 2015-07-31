local awful = require("awful")

awful.util.spawn_with_shell("run_once ncmpcpp && urxvt -name ncmcpp -e ncmcpp");
awful.util.spawn_with_shell("run_once laptop && urxvt -name laptop -e tmux");
