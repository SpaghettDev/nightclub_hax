-- This code is presented to you by SpaghettDev (https://github.com/TheGamer456YT)
---@diagnostic disable: undefined-global

local is_tony_cut_removed = false
local is_nc_cooldown_removed = false
local is_global_sigbal_extended = false
local is_safe_revenue_maxed = false
local is_safe_pay_time_0 = false
local nc_production_num = 1
local nc_stock_reset_num = 1


require_game_build(2699)
MainSubmenu = menu.add_submenu("SpaghettDev's Nightclub Hax")
PresetsSubmenu = MainSubmenu:add_submenu("Sell Presets")
UsefulSubmenu = MainSubmenu:add_submenu("Useful Things")
StatsEditorSubmenu = MainSubmenu:add_submenu("Stats Editor")
SafeOptionsSubmenu = MainSubmenu:add_submenu("Safe Options")
StockEditorSubmenu = MainSubmenu:add_submenu("Stock/Unit Values Editor")

ValuesSubmenu = MainSubmenu:add_submenu("Current Values")
StocksAndUnitsSubmenu = ValuesSubmenu:add_submenu("Stocks And Units")
StatsViewerSubmenu = ValuesSubmenu:add_submenu("Stats")

MainSubmenu:add_action("", function () end)
CreditsSubmenu = MainSubmenu:add_submenu("Credits")

local player_index = "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR")

local global_nightclub = 262145
local max_stock = 1500000

local nightclub_values = {
    ["Sporting Goods"] = {
        ["stock"] = {
            ["local"] = 24409,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24416,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["South American Imports"] = {
        ["stock"] = {
            ["local"] = 24410,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24417,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Pharmaceutical Research"] = {
        ["stock"] = {
            ["local"] = 24411,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24418,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Organic Produce"] = {
        ["stock"] = {
            ["local"] = 24412,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24419,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 250
        }
    },
    ["Printing and Copying"] = {
        ["stock"] = {
            ["local"] = 24413,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24420,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Cash Creation"] = {
        ["stock"] = {
            ["local"] = 24414,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24421,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["Cargo and Shipments"] = {
        ["stock"] = {
            ["local"] = 24415,
            ["m_min"] = 0,
            ["m_step"] = 100,
            ["m_max"] = max_stock
        },
        ["unit"] = {
            ["local"] = 24422,
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 200
        }
    },
    ["misc"] = {
        -- stats --
        ["popularity"] = player_index .. "_CLUB_POPULARITY",
        ["goods_sold"] = {
            ["stat"] = player_index .. "_LIFETIME_HUB_GOODS_SOLD",
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 1000000
        },
        ["goods_made"] = {
            ["stat"] = player_index .. "_LIFETIME_HUB_GOODS_MADE",
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 1000000
        },
        ["player_appear"] = {
            ["stat"] = player_index .. "_NIGHTCLUB_PLAYER_APPEAR",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 1000000
        },
        ["sales_completed"] = {
            ["stat"] = player_index .. "_HUB_SALES_COMPLETED",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 1000000
        },
        ["earnings"] = {
            ["stat"] = player_index .. "_HUB_EARNINGS",
            ["m_min"] = 1,
            ["m_step"] = 10,
            ["m_max"] = 100000000
        },
        ["nc_earnings"] = {
            ["stat"] = player_index .. "_NIGHTCLUB_EARNINGS",
            ["m_min"] = 1,
            ["m_step"] = 10,
            ["m_max"] = 100000000
        },
        ["jobs_done"] = {
            ["stat"] = player_index .. "_NIGHTCLUB_JOBS_DONE",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 100000
        },
        ["vip_appearances"] = {
            ["stat"] = player_index .. "_NIGHTCLUB_VIP_APPEAR",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 100000
        },
        ["mins_danced"] = {
            ["stat"] = player_index .. "_DANCE_COMBO_DURATION_MINS",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 100000000
        },
        ["nc_hotspot_time"] = {
            ["stat"] = player_index .. "_NIGHTCLUB_HOTSPOT_TIME_MS",
            ["m_min"] = 1,
            ["m_step"] = 1,
            ["m_max"] = 100000000
        },
        ["dj_choice"] = { -- doesn't work
            ["stat"] = player_index .. "_NIGHTCLUB_DJCHOICE",
            ["m_min"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 3
        },
        ["access"] = {
            ["access_enum"] = {
                [0] = "Everyone",
                "Crew",
                "Friends",
                "Crew + Friends",
                "Organization",
                "Associates",
                "No One"
            },
            ["default"] = 0,
            ["m_step"] = 1,
            ["m_max"] = 6,
            ["nightclub_ac"] = player_index .. "_NIGHTCLUBACCESSSETTING",
            ["djbooth_ac"] = player_index .. "_DJBOOTHACCESSSETTING",
            ["vipclub_ac"] = player_index .. "_VIPCLUBACCESSSETTING",
            ["office_ac"] = player_index .. "_CLUBOFFACCESSSETTING"
        },

        -- misc --
        ["pos"] = {
            ["x"] = -1617.869507,
            ["y"] = -3013.567871,
            ["z"] = -76.505043,
            ["yaw"] = -1.661497,
            ["roll"] =  0.000000,
            ["pitch"] =  -0.000000
        },
        ["safe"] = {
            ["limit"] = {
                ["local"] = 24073,
                ["default"] = 250000,
                ["mod"] = 300000,
                ["m_min"] = 0,
                ["m_step"] = 1000,
                ["m_max"] = 300000
            },
            ["revenue"] = {
                ["stat"] = player_index .. "_CLUB_PAY_TIME_LEFT",
                ["stat_default"] = 2880000,
                ["local_first"] = 24049,
                ["m_default"] = 0,
                ["m_step"] = 1000,
                ["m_max"] = 300000,
                ["defaults"] = { -- https://www.unknowncheats.me/forum/3495627-post31.html
                    [1] = 1500,   -- 5% Nightclub Popularity
                    [2] = 1600,   -- 10% Nightclub Popularity
                    [3] = 1800,   -- 15% Nightclub Popularity
                    [4] = 2000,   -- 20% Nightclub Popularity
                    [5] = 2200,   -- 25% Nightclub Popularity
                    [6] = 2500,   -- 30% Nightclub Popularity
                    [7] = 8000,   -- 35% Nightclub Popularity
                    [8] = 8500,   -- 40% Nightclub Popularity
                    [9] = 9000,   -- 45% Nightclub Popularity
                    [10] = 9500,  -- 50% Nightclub Popularity
                    [11] = 10000, -- 55% Nightclub Popularity
                    [12] = 20000, -- 60% Nightclub Popularity
                    [13] = 21000, -- 65% Nightclub Popularity
                    [14] = 22000, -- 70% Nightclub Popularity
                    [15] = 23000, -- 75% Nightclub Popularity
                    [16] = 24000, -- 80% Nightclub Popularity
                    [17] = 25000, -- 85% Nightclub Popularity
                    [18] = 45000, -- 90% Nightclub Popularity
                    [19] = 50000, -- 95% Nightclub Popularity
                    [20] = 50000  -- 100% Nightclub Popularity
                }
            }
        },
        ["tony_cut"] = {
            ["local"] = 24524,
            ["default"] = 0.1,
            ["mod"] = 0
        },
        ["global_signal"] = {
            ["local"] = 24525,
            ["default"] = 20000,
            ["mod"] = 3600000
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
        ["stocks_stats"] = {
            ["Sporting Goods"] = player_index .. "HUB_PROD_TOTAL_1",
            ["South American Imports"] = player_index .. "HUB_PROD_TOTAL_2",
            ["Pharmaceutical Research"] = player_index .. "HUB_PROD_TOTAL_3",
            ["Organic Produce"] = player_index .. "HUB_PROD_TOTAL_4",
            ["Printing and Copying"] = player_index .. "HUB_PROD_TOTAL_5",
            ["Cash Creation"] = player_index .. "HUB_PROD_TOTAL_6",
            ["Cargo and Shipments"] = player_index .. "HUB_PROD_TOTAL_0"
        },
        ["nightclub_id"] = globals.get_int( -- uc thread (dont remember which thread) and ICYPhoenix#0727 and Ren#5219's MusinessBanager
            (1853348 + 1 + (localplayer:get_player_id() * 834) + 267) + 336
        ),
        ["nightclub_properties"] = { -- ICYPhoenix#0727 and Ren#5219's MusinessBanager
            [1] = {
                name = "La Mesa Nightclub",
                cords = {
                    x = 757.009,
                    y =  -1332.32,
                    z = 27.1802
                }
            },
            [2] = {
                name = "Mission Row Nightclub",
                cords = {
                    x = 345.7519,
                    y =  -978.8848,
                    z = 29.2681
                }
            },
            [3] = {
                name = "Strawberry Nightclub",
                cords = {
                    x = -120.906,
                    y =  -1260.49,
                    z = 29.2088
                }
            },
            [4] = {
                name = "West Vinewood Nightclub",
                cords = {
                    x = 5.53709,
                    y =  221.35,
                    z = 107.6566
                }
            },
            [5] = {
                name = "Cypress Flats Nightclub",
                cords = {
                    x = 871.47,
                    y =  -2099.57,
                    z = 30.3768
                }
            },
            [6] = {
                name = "LSIA Nightclub",
                cords = {
                    x = -676.625,
                    y =  -2458.15,
                    z = 13.8444
                }
            },
            [7] = {
                name = "Elysian Island Nightclub",
                cords = {
                    x = 195.534,
                    y =  -3168.88,
                    z = 5.7903
                }
            },
            [8] = {
                name = "Downtown Vinewood Nightclub",
                cords = {
                    x = 373.05,
                    y =  252.13,
                    z = 102.9097
                }
            },
            [9] = {
                name = "Del Perro Nightclub",
                cords = {
                    x = -1283.38,
                    y =  -649.916,
                    z = 26.5198
                }
            },
            [10] = {
                name = "Vespucci Canals Nightclub",
                cords = {
                    x = -1174.85,
                    y =  -1152.3,
                    z = 5.56128
                }
            }
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

local nc_ac = stats.get_int(nightclub_values.misc.access.nightclub_ac)
local djbooth_ac = stats.get_int(nightclub_values.misc.access.djbooth_ac)
local vipclub_ac = stats.get_int(nightclub_values.misc.access.vipclub_ac)
local office_ac = stats.get_int(nightclub_values.misc.access.office_ac)
local all_ac = 0

----------------------------------------------
--            #region functions             --
----------------------------------------------

---function that adds text ig
---@param menu_t menu
---@param text string
local function add_text(menu_t, text)
    if menu_t ~= nil then
        menu_t:add_action(text, function() end)
    end
end

--- function that sets a stock's sell value
---@param stock string
---@param value integer
local function set_stock_value(stock, value)
    globals.set_int(global_nightclub + nightclub_values[stock].stock["local"], value)
end

--- function that gets a stock's sell value
---@param stock string
---@return integer
local function get_stock_value(stock)
    return globals.get_int(global_nightclub + nightclub_values[stock].stock["local"])
end

--- function that sets a stock's max unit value
---@param stock string
---@param value integer
local function set_unit_value(stock, value)
    globals.set_int(global_nightclub + nightclub_values[stock].unit["local"], value)
end

--- function that gets a stock's max unit value
---@param stock string
local function get_unit_value(stock)
    return globals.get_int(global_nightclub + nightclub_values[stock].unit["local"])
end

--- function that returns stock to its default production time
---@param stock string
local function return_to_spt_default(stock) -- spt: stock production time
    globals.set_int(
        global_nightclub + nightclub_values.misc.stocks_production[stock]["local"],
        nightclub_values.misc.stocks_production[stock].default
    )
end

--- function that adds an item viewer
---@param menu_t menu
---@param item string
---@param value any
---@param is_last boolean 
local function add_item_viewer(menu_t, item, value, is_last)
    add_text(menu_t, item .. ":")

    menu_t:add_bare_item(
        "Item Viewer",
        function ()
            return value
        end,
        function () end,
        function () end,
        function () end
    )

    if not is_last then
        add_text(menu_t, "")
    end
end

--- function that adds stock/unit values
---@param menu_t menu
---@param stock string
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

    if stock ~= nightclub_values.misc.stocks[7] then
        add_text(menu_t, "")
    end
end

--- function that adds stock/unit int_range
---@param menu_t menu
---@param stock string
local function add_stock_values_editor(menu_t, stock)
    if stock ~= nightclub_values.misc.stocks[1] then
        add_text(menu_t, "")
    end

    menu_t:add_int_range(
        stock .. " Stock Value",
        nightclub_values[stock].stock.m_step,
        nightclub_values[stock].stock.m_min,
        nightclub_values[stock].stock.m_max,
        function ()
            return get_stock_value(stock)
        end,
        function (value)
            set_stock_value(stock, value)
        end
    )

    menu_t:add_int_range(
        stock .. " Max Unit",
        nightclub_values[stock].unit.m_step,
        nightclub_values[stock].unit.m_min,
        nightclub_values[stock].unit.m_max,
        function ()
            return get_unit_value(stock)
        end,
        function (value)
            set_unit_value(stock, value)
        end
    )
end

--- function that resets stock(s) by setting their max units to 0, settings their spt to 1,
--- then setting them back to normal
---@param stock string | nil
local function reset_stocks(stock)
    if stock then
        set_unit_value(stock, 0)
        menu.trigger_nightclub_production()
        sleep(10)
        set_unit_value(stock, nightclub_values[stock].unit.m_min)
        return
    end

    for _, stock_val in pairs(nightclub_values.misc.stocks) do
        set_unit_value(stock_val, 0)
    end
    menu.trigger_nightclub_production()
    sleep(10)
    for _, stock_val in pairs(nightclub_values.misc.stocks) do
        set_unit_value(stock_val, nightclub_values[stock_val].unit.m_min)
    end
end

--- function that activates a preset
---@param preset_num integer
local function activate_preset(preset_num)
    reset_stocks(nil)

    sleep(5)

    for _, stock in pairs(nightclub_values.misc.presets[preset_num].stocks) do
        set_stock_value(stock, nightclub_values.misc.presets[preset_num].values[stock])
        set_unit_value(stock, 5)
    end

    for
        i = global_nightclub + nightclub_values.misc.stocks_production[
            nightclub_values.misc.stocks[1]
        ]["local"],
        global_nightclub + nightclub_values.misc.stocks_production[
            nightclub_values.misc.stocks[7]
        ]["local"]
    do
        globals.set_int(i, 1)
    end

    for _ = 1, 5 do
        menu.trigger_nightclub_production()
        sleep(5)
    end
end

----------------------------------------------
--          #endregion functions            --
----------------------------------------------


----------------------------------------------
--          #region UsefulSubmenu           --
----------------------------------------------

UsefulSubmenu:add_action(
    "Return everything to their default value",
    function ()
        for _, stock in pairs(nightclub_values.misc.stocks) do
            set_stock_value(stock, nightclub_values[stock].stock.m_min)
            set_unit_value(stock, nightclub_values[stock].unit.m_min)
        end

        globals.set_int(
            global_nightclub + nightclub_values.misc.safe.limit["local"],
            nightclub_values.misc.safe.limit.default
        )

        for num, default in pairs(nightclub_values.misc.safe.revenue.defaults) do
            globals.set_int(
                global_nightclub + nightclub_values.misc.safe.revenue.local_first + num,
                default
            )
        end

        stats.set_int(
            global_nightclub + nightclub_values.misc.safe.revenue.stat,
            nightclub_values.misc.safe.revenue.stat_default
        )

        globals.set_float(
            global_nightclub + nightclub_values.misc.tony_cut["local"],
            nightclub_values.misc.tony_cut.default
        )

        globals.set_int(
            global_nightclub + nightclub_values.misc.global_signal["local"],
            nightclub_values.misc.global_signal["default"]
        )

        for _, stock in pairs(nightclub_values.misc.stocks) do
            return_to_spt_default(stock)
        end

        for _, value in pairs(nightclub_values.misc.cooldown) do
            globals.set_int(global_nightclub + value["local"], value.default)
        end
    end
)

UsefulSubmenu:add_action(
    "Max Nightclub Popularity",
    function()
        stats.set_int(
            nightclub_values.misc.popularity,
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
    "Teleport to Nightclub",
    function ()
        localplayer:set_position(
            nightclub_values.misc.nightclub_properties[nightclub_values.misc.nightclub_id].cords.x,
            nightclub_values.misc.nightclub_properties[nightclub_values.misc.nightclub_id].cords.y,
            nightclub_values.misc.nightclub_properties[nightclub_values.misc.nightclub_id].cords.z
        )
    end
)

UsefulSubmenu:add_action(
    "Teleport to Office (might not work)",
    function ()
        localplayer:set_position(
            nightclub_values.misc.pos.x,
            nightclub_values.misc.pos.y,
            nightclub_values.misc.pos.z
        )
        localplayer:set_rotation(
            nightclub_values.misc.pos.yaw,
            nightclub_values.misc.pos.roll,
            nightclub_values.misc.pos.pitch
        )
    end
)

UsefulSubmenu:add_action(
    "Reset All Stocks To 0",
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
                nightclub_values.misc.tony_cut["local"],
                nightclub_values.misc.tony_cut.mod
            )
        else
            globals.set_float(
                global_nightclub +
                nightclub_values.misc.tony_cut["local"],
                nightclub_values.misc.tony_cut.default
            )
        end
    end
)

UsefulSubmenu:add_toggle(
    "Extend Global Signal",
    function ()
        return is_global_sigbal_extended
    end,
    function (state)
        is_global_sigbal_extended = state
        if state then
            globals.set_float(
                global_nightclub +
                nightclub_valuesmisc.global_signal["local"],
                nightclub_valuesmisc.global_signal.mod
            )
        else
            globals.set_float(
                global_nightclub +
                nightclub_valuesmisc.global_signal["local"],
                nightclub_valuesmisc.global_signal.default
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
            for _, value in pairs(nightclub_values.misc.cooldown) do
                globals.set_int(global_nightclub + value["local"], value.mod)
            end
        else
            for _, value in pairs(nightclub_values.misc.cooldown) do
                globals.set_int(global_nightclub + value["local"], value.default)
            end
        end
    end
)

UsefulSubmenu:add_array_item(
    "Reset Stock to 0",
    nightclub_values.misc.stocks,
    function ()
        return nc_stock_reset_num
    end,
    function (value)
        nc_stock_reset_num = value
        reset_stocks(nightclub_values.misc.stocks[value])
    end
)

UsefulSubmenu:add_array_item(
    "Production",
    {"Speed Up", "Reset Speed"},
    function ()
        return nc_production_num
    end,
    function (value)
        nc_production_num = value
        if value == 1 then
            for
                i = global_nightclub + nightclub_values.misc.stocks_production[
                    nightclub_values.misc.stocks[1]
                ]["local"],
                global_nightclub + nightclub_values.misc.stocks_production[
                    nightclub_values.misc.stocks[7]
                ]["local"]
            do
                globals.set_int(i, 1)
            end
            menu.trigger_nightclub_production()
        else
            for _, stock in pairs(nightclub_values.misc.stocks) do
                return_to_spt_default(stock)
            end
        end
    end
)

add_text(UsefulSubmenu, "")
USReadMeSubmenu = UsefulSubmenu:add_submenu("Read Me")

add_text(USReadMeSubmenu, "About resetting stocks:")
add_text(USReadMeSubmenu, "When resetting a stock to 0,")
add_text(USReadMeSubmenu, "please wait a little bit.")

----------------------------------------------
--          #endregion UsefulSubmenu        --
----------------------------------------------



----------------------------------------------
--          #region StatsSubmenu            --
----------------------------------------------

StatsEditorSubmenu:add_int_range(
    "Number of Goods Sold",
    nightclub_values.misc.goods_sold.m_step,
    nightclub_values.misc.goods_sold.m_min,
    nightclub_values.misc.goods_sold.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.goods_sold.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.goods_sold.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of Goods Made",
    nightclub_values.misc.goods_made.m_step,
    nightclub_values.misc.goods_made.m_min,
    nightclub_values.misc.goods_made.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.goods_made.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.goods_made.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of Sales",
    nightclub_values.misc.sales_completed.m_step,
    nightclub_values.misc.sales_completed.m_min,
    nightclub_values.misc.sales_completed.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.sales_completed.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.sales_completed.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Total Earnings (HUB_EARNINGS)",
    nightclub_values.misc.earnings.m_step,
    nightclub_values.misc.earnings.m_min,
    nightclub_values.misc.earnings.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.earnings.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.earnings.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Total Earnings (NIGHTCLUB_EARNINGS)",
    nightclub_values.misc.nc_earnings.m_step,
    nightclub_values.misc.nc_earnings.m_min,
    nightclub_values.misc.nc_earnings.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.nc_earnings.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.nc_earnings.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of jobs done",
    nightclub_values.misc.jobs_done.m_step,
    nightclub_values.misc.jobs_done.m_min,
    nightclub_values.misc.jobs_done.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.jobs_done.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.jobs_done.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of VIP appearances",
    nightclub_values.misc.vip_appearances.m_step,
    nightclub_values.misc.vip_appearances.m_min,
    nightclub_values.misc.vip_appearances.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.vip_appearances.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.vip_appearances.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of Players who Entered",
    nightclub_values.misc.player_appear.m_step,
    nightclub_values.misc.player_appear.m_min,
    nightclub_values.misc.player_appear.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.player_appear.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.player_appear.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Number of Minutes Player has Danced",
    nightclub_values.misc.mins_danced.m_step,
    nightclub_values.misc.mins_danced.m_min,
    nightclub_values.misc.mins_danced.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.mins_danced.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.mins_danced.stat, value)
    end
)

StatsEditorSubmenu:add_int_range(
    "Nightclub Hostpot Time in Minutes",
    nightclub_values.misc.nc_hotspot_time.m_step,
    nightclub_values.misc.nc_hotspot_time.m_min,
    nightclub_values.misc.nc_hotspot_time.m_max,
    function ()
        return stats.get_int(nightclub_values.misc.nc_hotspot_time.stat)
    end,
    function (value)
        stats.set_int(nightclub_values.misc.nc_hotspot_time.stat, value)
    end
)

add_text(StatsEditorSubmenu, "")
add_text(StatsEditorSubmenu, "Access Stats:")

StatsEditorSubmenu:add_array_item(
    "Nightclub Access",
    nightclub_values.misc.access.access_enum,
    function ()
        return nc_ac
    end,
    function (value)
        nc_ac = value
        stats.set_int(nightclub_values.misc.access.nightclub_ac, value)
    end
)

StatsEditorSubmenu:add_array_item(
    "DJ Booth Access",
    nightclub_values.misc.access.access_enum,
    function ()
        return djbooth_ac
    end,
    function (value)
        djbooth_ac = value
        stats.set_int(nightclub_values.misc.access.djbooth_ac, value)
    end
)

StatsEditorSubmenu:add_array_item(
    "VIP Club Access",
    nightclub_values.misc.access.access_enum,
    function ()
        return vipclub_ac
    end,
    function (value)
        vipclub_ac = value
        stats.set_int(nightclub_values.misc.access.vipclub_ac, value)
    end
)

StatsEditorSubmenu:add_array_item(
    "Office Access",
    nightclub_values.misc.access.access_enum,
    function ()
        return office_ac
    end,
    function (value)
        office_ac = value
        stats.set_int(nightclub_values.misc.access.office_ac, value)
    end
)

StatsEditorSubmenu:add_array_item(
    "All Access",
    nightclub_values.misc.access.access_enum,
    function ()
        return all_ac
    end,
    function (value)
        all_ac = value
        stats.set_int(nightclub_values.misc.access.nightclub_ac, value)
        stats.set_int(nightclub_values.misc.access.djbooth_ac, value)
        stats.set_int(nightclub_values.misc.access.vipclub_ac, value)
        stats.set_int(nightclub_values.misc.access.office_ac, value)
    end
)

----------------------------------------------
--          #endregion StatsSubmenu         --
----------------------------------------------



----------------------------------------------
--          #region SafeOptionsSubmenu      --
----------------------------------------------

SafeOptionsSubmenu:add_action(
    "Set Safe Limit to 300k",
    function ()
        globals.set_int(
            global_nightclub + nightclub_values.misc.safe.limit["local"],
            nightclub_values.misc.safe.limit.mod
        )
    end
)

SafeOptionsSubmenu:add_int_range(
    "Set Safe Limit",
    nightclub_values.misc.safe.limit.m_step,
    nightclub_values.misc.safe.limit.m_min,
    nightclub_values.misc.safe.limit.m_max,
    function ()
        return globals.get_int(
            global_nightclub + nightclub_values.misc.safe.limit["local"]
        )
    end,
    function (value)
        globals.set_int(
            global_nightclub + nightclub_values.misc.safe.limit["local"],
            value
        )
    end
)

SafeOptionsSubmenu:add_toggle(
    "Set Safe Revenue to 300k",
    function ()
        return is_safe_revenue_maxed
    end,
    function (state)
        is_safe_revenue_maxed = state
        for i = 1, 20 do
            globals.set_int(
                global_nightclub + nightclub_values.misc.safe.revenue.local_first + i,
                nightclub_values.misc.safe.limit.mod
            )
        end
    end
)

SafeOptionsSubmenu:add_int_range(
    "Set Safe Revenue",
    nightclub_values.misc.safe.revenue.m_step,
    nightclub_values.misc.safe.revenue.m_default,
    nightclub_values.misc.safe.revenue.m_max,
    function ()
        return globals.get_int(
            global_nightclub + nightclub_values.misc.safe.revenue.local_first
        )
    end,
    function (value)
        for i = 1, 20 do
            globals.set_int(
                global_nightclub + nightclub_values.misc.safe.revenue.local_first + i,
                value
            )
        end
    end
)

SafeOptionsSubmenu:add_toggle(
    "Set Safe Pay Time to -1 (Semi-Instand Pay)",
    function ()
        return is_safe_pay_time_0
    end,
    function (state)
        is_safe_pay_time_0 = state
        stats.set_int(nightclub_values.misc.safe.revenue.stat, -1)
    end
)

----------------------------------------------
--       #endregion SafeOptionsSubmenu      --
----------------------------------------------




----------------------------------------------
--          #region PresetsSubmenu          --
----------------------------------------------

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

add_text(PresetsSubmenu, "")
PSReadMeSubmenu = PresetsSubmenu:add_submenu("Read Me")
add_text(PSReadMeSubmenu, "For the current presets to work you'll need:")
add_text(PSReadMeSubmenu, "                    Sporting Goods")
add_text(PSReadMeSubmenu, "                    South American Imports")
add_text(PSReadMeSubmenu, "                    Organic Produce")
add_text(PSReadMeSubmenu, "                    Cash Creation")
add_text(PSReadMeSubmenu, "                    Cargo and Shipments")

----------------------------------------------
--          #endregion PresetsSubmenu       --
----------------------------------------------



----------------------------------------------
--    #region StocksStatsEditorViewer       --
----------------------------------------------

for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
    add_stock_values_editor(StockEditorSubmenu, stock)
end


for _, stock in pairs(nightclub_values["misc"]["stocks"]) do
    add_stock_values(StocksAndUnitsSubmenu, stock)
end


add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Popularity",
    stats.get_int(nightclub_values.misc.popularity),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Goods Sold",
    stats.get_int(nightclub_values.misc.goods_sold.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Goods Made",
    stats.get_int(nightclub_values.misc.goods_made.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "No. of Players who Entered Nightclub",
    stats.get_int(nightclub_values.misc.player_appear.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "No. Sales Completed",
    stats.get_int(nightclub_values.misc.sales_completed.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Earnings (HUB_EARNINGS)",
    stats.get_int(nightclub_values.misc.earnings.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Earnings (NIGHTCLUB_EANINGS)",
    stats.get_int(nightclub_values.misc.nc_earnings.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "No. of Nightclub Jobs Done",
    stats.get_int(nightclub_values.misc.jobs_done.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "No. of VIP appearances",
    stats.get_int(nightclub_values.misc.vip_appearances.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "No. of Minutes Danced",
    stats.get_int(nightclub_values.misc.mins_danced.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Hotspot Time",
    stats.get_int(nightclub_values.misc.nc_hotspot_time.stat),
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Access",
    nightclub_values.misc.access.access_enum[
        stats.get_int(nightclub_values.misc.access.nightclub_ac)
    ],
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "DJ Booth Access",
    nightclub_values.misc.access.access_enum[
        stats.get_int(nightclub_values.misc.access.djbooth_ac)
    ],
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "VIP Club Access",
    nightclub_values.misc.access.access_enum[
        stats.get_int(nightclub_values.misc.access.vipclub_ac)
    ],
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Office Access",
    nightclub_values.misc.access.access_enum[
        stats.get_int(nightclub_values.misc.access.office_ac)
    ],
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Safe Limit",
    globals.get_int(global_nightclub + nightclub_values.misc.safe.limit["local"]),
    false
)

for i = 1, 20 do
    add_item_viewer(
        StatsViewerSubmenu,
        "Safe Revenue at " .. i * 5 .. " % Popularity",
        globals.get_int(
            global_nightclub +
            nightclub_values.misc.safe.revenue.local_first +
            i
        ),
        false
    )
end

add_item_viewer(
    StatsViewerSubmenu,
    "Safe Pay Time Left",
    stats.get_int(nightclub_values.misc.safe.revenue.stat) / 60000 .. " min",
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Tony's Cut",
    globals.get_float(
        global_nightclub + nightclub_values.misc.tony_cut["local"]
    ) * 1000000,
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Global Signal",
    globals.get_int(
        global_nightclub + nightclub_values.misc.global_signal["local"]
    ) / 1000 .. " sec",
    false
)

for stock, value in pairs(nightclub_values.misc.stocks_production) do
    add_item_viewer(
        StatsViewerSubmenu,
        stock .. " Production Time",
        globals.get_int(
            global_nightclub + value["local"]
        ) / 60000 .. " min",
        false
    )
end

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Sell Cooldown (1)",
    globals.get_int(
        global_nightclub + nightclub_values.misc.cooldown.val1["local"]
    ) / 60000 .. " min",
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Sell Cooldown (2)",
    globals.get_int(
        global_nightclub + nightclub_values.misc.cooldown.val2["local"]
    ) / 60000 .. " min",
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Nightclub Sell Cooldown (3)",
    globals.get_int(
        global_nightclub + nightclub_values.misc.cooldown.val3["local"]
    ) / 60000 .. " min",
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "ID of Currently Owned Nightclub",
    nightclub_values.misc.nightclub_id,
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Name of Currently Owned Nightclub",
    nightclub_values.misc.nightclub_properties[
        nightclub_values.misc.nightclub_id
    ].name,
    false
)

add_item_viewer(
    StatsViewerSubmenu,
    "Cords of Currently Owned Nightclub",
    (
        "X: " .. nightclub_values.misc.nightclub_properties[
            nightclub_values.misc.nightclub_id
        ].cords.x ..
        " Y: " .. nightclub_values.misc.nightclub_properties[
            nightclub_values.misc.nightclub_id
        ].cords.y ..
        " Z: " .. nightclub_values.misc.nightclub_properties[
            nightclub_values.misc.nightclub_id
        ].cords.z
    ),
    true
)


----------------------------------------------
--    #endregion StocksStatsEditorViewer    --
----------------------------------------------

add_text(CreditsSubmenu, "Kiddions - The maker of this amazing menu")
add_text(CreditsSubmenu, "SpaghettDev - Developer of this script")
add_text(CreditsSubMenu, "UknownCheats - Their extensive userbase")
add_text(CreditsSubmenu, "MusinessBanager - Inspiration")
add_text(CreditsSubmenu, "Killa'B's Ultimate Controller - Inspiration")
add_text(CreditsSubmenu, "Modest Support - Cool place")
add_text(CreditsSubmenu, "Thorben's server - Another cool place")
