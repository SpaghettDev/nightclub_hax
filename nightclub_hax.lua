-- This code is presented to you by SpaghettDev (https://github.com/TheGamer456YT)
---@diagnostic disable: undefined-global

local is_tony_cut_removed = false
local is_nc_cooldown_removed = false
local nc_production_num = 1
local nc_stock_reset_num = 1

require_game_build(2699)
MainSubmenu = menu.add_submenu("SpaghettDev's Nightclub Hax")
PresetsSubmenu = MainSubmenu:add_submenu("Sell Presets")
UsefulSubmenu = MainSubmenu:add_submenu("Useful Things")
StockEditorSubmenu = MainSubmenu:add_submenu("Stock/Unit Values Editor")
ValuesSubmenu = MainSubmenu:add_submenu("Current Values")
CreditsSubmenu = MainSubmenu:add_submenu("Credits")

local global_nightclub = 262145
local max_stock = 1500000

local nightclub_values = {
    ["Sporting Goods"] = {
        ["stock"] = {
            ["local"] = 24409,
            ["default"] = 5000,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24416,
            ["default"] = 100,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["South American Imports"] = {
        ["stock"] = {
            ["local"] = 24410,
            ["default"] = 20000,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24417,
            ["default"] = 10,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Pharmaceutical Research"] = {
        ["stock"] = {
            ["local"] = 24411,
            ["default"] = 8500,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24418,
            ["default"] = 20,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Organic Produce"] = {
        ["stock"] = {
            ["local"] = 24412,
            ["default"] = 1500,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24419,
            ["default"] = 80,
            ["m_step"] = 1,
            ["m_max"] = 250
        }
    },
    ["Printing and Copying"] = {
        ["stock"] = {
            ["local"] = 24413,
            ["default"] = 1000,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24420,
            ["default"] = 60,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Cash Creation"] = {
        ["stock"] = {
            ["local"] = 24414,
            ["default"] = 3500,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24421,
            ["default"] = 40,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Cargo and Shipments"] = {
        ["stock"] = {
            ["local"] = 24415,
            ["default"] = 10000,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24422,
            ["default"] = 50,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["misc"] = {
        ["popularity"] = "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_CLUB_POPULARITY",
        ["safe_limit"] = { -- might do something with this in the future
            ["local"] = 24073,
            ["default"] = 250000
        },
        ["tony_cut"] = {
            ["local"] = 24524,
            ["default"] = 0.1,
            ["mod"] = 0
        },
        ["stocks_production"] = {
            ["Sporting Goods"] = {
                ["local"] = 24394,
                ["default"] = 4800000
            },
            ["South American Imports"] = {
                ["local"] = 24395,
                ["default"] = 14400000
            },
            ["Pharmaceutical Research"] = {
                ["local"] = 24396,
                ["default"] = 7200000
            },
            ["Organic Produce"] = {
                ["local"] = 24397,
                ["default"] = 2400000
            },
            ["Printing and Copying"] = {
                ["local"] = 24398,
                ["default"] = 1800000
            },
            ["Cash Creation"] = {
                ["local"] = 24399,
                ["default"] = 3600000
            },
            ["Cargo and Shipments"] = {
                ["local"] = 24400,
                ["default"] = 8400000
            }
        },
        ["cooldown"] = {
            ["val1"] = {
                ["local"] = 24475,
                ["default"] = 300000,
                ["mod"] = 0
            },
            ["val2"] = {
                ["local"] = 24517,
                ["default"] = 300000,
                ["mod"] = 0
            },
            ["val3"] = {
                ["local"] = 24518,
                ["default"] = 300000,
                ["mod"] = 0
            }
        },
        ["stocks"] = {
            "Sporting Goods",
            "South American Imports",
            "Pharmaceutical Research",
            "Organic Produce",
            "Printing and Copying",
            "Cash Creation",
            "Cargo and Shipments"
        },
        ["presets"] = {
            [1] = {
                ["stocks"] = {
                    "Sporting Goods",
                    "South American Imports",
                    "Organic Produce",
                    "Cash Creation",
                    "Cargo and Shipments"
                },
                ["values"] = {
                    ["Sporting Goods"] = 100000,
                    ["South American Imports"] = 40000,
                    ["Organic Produce"] = 240000,
                    ["Cash Creation"] = 28000,
                    ["Cargo and Shipments"] = 100000
                },
            },
            [2] = {
                ["stocks"] = {
                    "Sporting Goods",
                    "South American Imports",
                    "Organic Produce",
                    "Cash Creation",
                    "Cargo and Shipments"
                },
                ["values"] = {
                    ["Sporting Goods"] = 200000,
                    ["South American Imports"] = 100000,
                    ["Organic Produce"] = 100000,
                    ["Cash Creation"] = 100000,
                    ["Cargo and Shipments"] = 200000
                }
            }
        }
    }
}


---function that adds text ig
---@param menu_t menu
---@param text string
local function add_text(menu_t, text)
    menu_t:add_action(text, function() end)
end

---function that sets a stock's sell value
---@param stock string
---@param value integer
local function set_stock_value(stock, value)
    globals.set_int(global_nightclub + nightclub_values[stock]["stock"]["local"], value)
end

---function that gets a stock's sell value
---@param stock string
local function get_stock_value(stock)
    return globals.get_int(global_nightclub + nightclub_values[stock]["stock"]["local"])
end

---function that sets a stock's max unit value
---@param stock string
---@param value integer
local function set_unit_value(stock, value)
    globals.set_int(global_nightclub + nightclub_values[stock]["unit"]["local"], value)
end

---function that gets a stock's max unit value
---@param stock string
local function get_unit_value(stock)
    return globals.get_int(global_nightclub + nightclub_values[stock]["unit"]["local"])
end

---function that returns stock to its default production time
---@param stock string
local function return_spt_default(stock) -- spt: stock production time
    globals.set_int(
        global_nightclub + nightclub_values["misc"]["stocks_production"][stock]["local"],
        nightclub_values["misc"]["stocks_production"][stock]["default"]
    )
end

---function that adds stock/unit values
---@param menu_t menu
---@param text string
local function add_stock_values(menu_t, stock)
    add_text(menu_t, stock .. ":")

    menu_t:add_bare_item(
        "Stock Values",
        function ()
            return "Stock Values: " .. get_stock_value(stock)
        end,
        function () end,
        function () end,
        function () end
    )

    menu_t:add_bare_item(
        "Max Units",
        function ()
            return "Max Units: " .. get_unit_value(stock)
        end,
        function () end,
        function () end,
        function () end
    )

    if stock ~= nightclub_values["misc"]["stocks"][7] then
        add_text(menu_t, "")
    end
end

---function that adds stock/unit int_range
---@param menu_t menu
---@param stock string
local function add_stock_values_editor(menu_t, stock)
    if stock ~= nightclub_values["misc"]["stocks"][1] then
        add_text(menu_t, "")
    end

    menu_t:add_int_range(
        stock .. " Stock Value",
        nightclub_values[stock]["stock"]["m_step"],
        nightclub_values[stock]["stock"]["default"],
        nightclub_values[stock]["stock"]["m_max"],
        function ()
            return get_stock_value(stock)
        end,
        function (value)
            set_stock_value(stock, value)
        end
    )

    menu_t:add_int_range(
        stock .. " Max Unit",
        nightclub_values[stock]["unit"]["m_step"],
        nightclub_values[stock]["unit"]["default"],
        nightclub_values[stock]["unit"]["m_max"],
        function ()
            return get_unit_value(stock)
        end,
        function (value)
            set_unit_value(stock, value)
        end
    )
end

---function that resets stock(s) by setting their max units to 0, triggering production, then setting them back to normal
---@param stock string | nil
local function reset_stocks(stock)
    if stock then
        set_unit_value(stock, 0)
        menu.trigger_nightclub_production()
        sleep(10)
        set_unit_value(stock, nightclub_values[stock]["unit"]["default"])
    end

    for _, stock_val in pairs(nightclub_values["misc"]["stocks"]) do
        set_unit_value(stock_val, 0)
    end
    menu.trigger_nightclub_production()
    sleep(10)
    for _, stock_val in pairs(nightclub_values["misc"]["stocks"]) do
        set_unit_value(stock_val, nightclub_values[stock_val]["unit"]["default"])
    end
end

---function that activates a preset
---@param preset_num integer
local function activate_preset(preset_num)
    reset_stocks(nil)

    for _, stock in pairs(nightclub_values["misc"]["presets"][preset_num]["stocks"]) do
        set_stock_value(stock, nightclub_values["misc"]["presets"][preset_num]["values"][stock])
        set_unit_value(stock, 5)
    end

    for
        i = global_nightclub + nightclub_values["misc"]["stocks_production"]["Sporting Goods"]["local"],
        global_nightclub + nightclub_values["misc"]["stocks_production"]["Cargo and Shipments"]["local"]
    do
        globals.set_int(i, 1)
    end

    for _ = 1, 5 do
        menu.trigger_nightclub_production()
        sleep(5)
    end
end


UsefulSubmenu:add_action(
    "Return to default values",
    function ()
        for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
            set_stock_value(stock, nightclub_values[stock]["stock"]["default"])
            set_unit_value(stock, nightclub_values[stock]["unit"]["default"])
        end

        globals.set_float(
            global_nightclub +
            nightclub_values["misc"]["tony_cut"]["local"],
            nightclub_values["misc"]["tony_cut"]["default"]
        )
    end
)

UsefulSubmenu:add_action(
    "Max Nightclub Popularity",
    function()
        stats.set_int(
            nightclub_values["misc"]["popularity"],
            1000
        )
    end
)

UsefulSubmenu:add_action(
    "Trigger Nightclub Production",
    function ()
        menu.trigger_nightclub_production()
    end
)

UsefulSubmenu:add_action(
    "Teleport to Office",
    function ()
        localplayer:set_position(-1617.869507, -3013.567871, -76.505043)
        localplayer:set_rotation(-1.661497, 0.000000, -0.000000)
    end
)

UsefulSubmenu:add_action(
    "Reset Stocks To 0",
    function ()
        reset_stocks(nil)
    end
)

UsefulSubmenu:add_toggle(
    "Remove Tony's cut",
    function ()
        return is_tony_cut_removed
    end,
    function (state)
        is_tony_cut_removed = state
        if state then
            globals.set_float(
                global_nightclub +
                nightclub_values["misc"]["tony_cut"]["local"],
                nightclub_values["misc"]["tony_cut"]["mod"]
            )
        else
            globals.set_float(
                global_nightclub +
                nightclub_values["misc"]["tony_cut"]["local"],
                nightclub_values["misc"]["tony_cut"]["default"]
            )
        end
    end
)

UsefulSubmenu:add_toggle(
    "Remove Nightclub Sell Cooldown",
    function ()
        return is_nc_cooldown_removed
    end,
    function (state)
        is_nc_cooldown_removed = state
        if state then
            for _, value in pairs(nightclub_values["misc"]["cooldown"]) do
                globals.set_int(global_nightclub + value["local"], value["mod"])
            end
        else
            for _, value in pairs(nightclub_values["misc"]["cooldown"]) do
            globals.set_int(global_nightclub + value["local"], value["default"])
            end
        end
    end
)

UsefulSubmenu:add_array_item(
    "Reset Stock to 0",
    nightclub_values["misc"]["stocks"],
    function ()
        return nc_stock_reset_num
    end,
    function (state)
        nc_stock_reset_num = state
        reset_stocks(nightclub_values["misc"]["stocks"][state])
    end
)

UsefulSubmenu:add_array_item(
    "Production",
    {"Speed Up", "Reset Speed"},
    function ()
        return nc_production_num
    end,
    function (state)
        nc_production_num = state
        if state == 1 then
            for
                i = global_nightclub + nightclub_values["misc"]["stocks_production"]["Sporting Goods"]["local"],
                global_nightclub + nightclub_values["misc"]["stocks_production"]["Cargo and Shipments"]["local"]
            do
                globals.set_int(i, 1)
            end
            menu.trigger_nightclub_production()
        else
            for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
                return_spt_default(stock)
            end
        end
    end
)


PresetsSubmenu:add_action(
    "Normal Sell ($2.54mil)",
    function ()
        activate_preset(1)
    end
)

PresetsSubmenu:add_action(
    "Max Sell ($3.5mil)",
    function ()
        activate_preset(2)
    end
)


for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
    add_stock_values_editor(StockEditorSubmenu, stock)
end


for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
    add_stock_values(ValuesSubmenu, stock)
end


add_text(CreditsSubmenu, "Kiddions - The maker of this amazing menu")
add_text(CreditsSubmenu, "SpaghettDev - Developer of this script")
add_text(CreditsSubmenu, "Killa'B's Ultimate Controller - Inspiration")
add_text(CreditsSubmenu, "Mosdest Support - Cool place")
add_text(CreditsSubmenu, "Thorben's server - Another cool place")
