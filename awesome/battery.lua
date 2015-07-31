-- battery warning
-- created by bpdp

local function trim(s)
        return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

local function bat_notification()

        local f_capacity = assert(io.open("/sys/class/power_supply/BAT0/capacity", "r"))
        local f_status = assert(io.open("/sys/class/power_supply/BAT0/status", "r"))

        local bat_capacity = tonumber(f_capacity:read("*all"))
        local bat_status = trim(f_status:read("*all"))

        if (bat_capacity <= 10 and bat_status == "Discharging") then
                naughty.notify({ title      = "Battery Warning"
                , text       = "Battery low! " .. bat_capacity .."%" .. " left!"
                , fg="#ff0000"
                , bg="#deb887"
                , timeout    = 15
                , position   = "bottom_left"
        })
        end
end

battimer = timer({timeout = 120})
battimer:connect_signal("timeout", bat_notification)
battimer:start()

-- end here for battery warning
