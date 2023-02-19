-----===========================-----
----    Cruise Missile for Stand
----        by StealthyAD
----    Breaking the Boundaries
---- of the border for cruise missile
-----===========================-----

----=============----
--- Natives Stand
----=============----

util.keep_running()
util.require_natives("natives-1660775568")
util.require_natives('natives-1663599433-uno')

----===============----
--- Version Script
----===============----

local SCRIPT_VERSION = "0.2"
local edition_menu = "99.3"

----===========----
--- Cruise Root
----===========----

local CruiseRoot = menu.my_root()
local CruiseHelp = util.show_corner_help
local CruiseCommands = menu.trigger_commands
local CruiseToast = util.toast

----==========----
--- Functions 
----==========----

function SET_INT_GLOBAL(Global, Value)
    memory.write_int(memory.script_global(Global), Value)
end

function GET_INT_LOCAL(script, script_local)
    if memory.script_local(script, script_local) ~= 0 then
        local ReadLocal = memory.read_int(memory.script_local(script, script_local))
        if ReadLocal ~= nil then
            return ReadLocal
        end
    end
end

function EXECUTION_FUNCTION_WORKING(IsAddNewLine)
    local State = ""
    local Version = tonumber(NETWORK.GET_ONLINE_VERSION())
    if util.is_session_started() then
        if GET_INT_LOCAL("freemode", 3618) ~= util.joaat("lr_prop_carkey_fob") then 
        end
    end
    return State
end

----================----
--- Main Cruise Root
----================----

    CruiseRoot:action("Restart Script", {'cruiserestart'}, "Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile.", function() -- Restart Script
        SET_INT_GLOBAL(262145 + 30188, 4000) -- Revert Distance Between Kosatka and Cruise Missile
        SET_INT_GLOBAL(262145 + 30187, 60000) -- Revert Cooldown
        util.restart_script()
    end)

    CruiseRoot:divider("Main Menu")

    ----================----
    --- Cruise Root Presets
    ----================----

    local CruisePresets = CruiseRoot:list("Presets")

        CruisePresets:toggle_loop("Cruise Missile Range (15 KM)", {"cruise15km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 10 KM Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (15 KM)")
            CruiseCommands('damagemultiplier 7500')
            SET_INT_GLOBAL(262145 + 30188, 15000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (15 KM)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop("Cruise Missile Range (30 KM)", {"cruise30km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 30 KM Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (30 KM)")
            CruiseCommands('damagemultiplier 8500')
            SET_INT_GLOBAL(262145 + 30188, 30000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (30 KM)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop("Cruise Missile Range (60 KM)", {"cruise60km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 60 KM Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (60 KM)")
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 60000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (60 KM)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop("Cruise Missile Range (Bypass)", {"cruisebypass"}, EXECUTION_FUNCTION_WORKING(false), function() -- Bypass Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active")
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 99999)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

    ----===================----
    --- Cruise Root Presets
    ----===================----

    CruiseMissileFire = CruiseRoot:slider("Cruise Missile Range", {"cruisemissilerange"}, "Make sure you put the limit atleast 99 KM/H\nE.G: you want unlimited range, put the max.", 2, 99, 4, 1, function()end) -- Maximise your chance to hit enemy to high range

    CruiseRoot:toggle_loop("Toggle Cooldown Cruise Missile", {'cruisemissilecooldown'}, EXECUTION_FUNCTION_WORKING(false), function()
        SET_INT_GLOBAL(262145 + 30187, 0)
    end,function()
        SET_INT_GLOBAL(262145 + 30187, 60000)
    end)

    CruiseRoot:action("Execute Cruise Missile", {"cruisemissilefire"}, "NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State.", function()
        SET_INT_GLOBAL(262145 + 30188, menu.get_value(CruiseMissileFire) * 1000)

        if menu.get_value(CruiseMissileFire) >= 20 then -- Extra Long Range Range Missile
            CruiseHelp("Cruise Missile\nStatus : Extra Long Range Missile")
            CruiseCommands('damagemultiplier 10000')
        end

        if menu.get_value(CruiseMissileFire) >= 10 and menu.get_value(CruiseMissileFire) <= 19 then -- Long Range Missile
            CruiseHelp("Cruise Missile\nStatus : Long Range Missile")
            CruiseCommands('damagemultiplier 7500')
        end

        if menu.get_value(CruiseMissileFire) >=6 and menu.get_value(CruiseMissileFire) <= 9 then -- Medium Range Missile
            CruiseHelp("Cruise Missile\nStatus : Medium Range Missile")
            CruiseCommands('damagemultiplier 10000')
        end

        if menu.get_value(CruiseMissileFire) >= 4 and menu.get_value(CruiseMissileFire) <= 5 then -- Standard Missile
            CruiseHelp("Cruise Missile\nStatus : Standard Missile")
            CruiseCommands('damagemultiplier 1')
        end
        if menu.get_value(CruiseMissileFire) >= 2 and menu.get_value(CruiseMissileFire) <= 3 then -- Short Range Missile
            CruiseHelp("Cruise Missile\nStatus : Short Range Missile")
            CruiseCommands('damagemultiplier 1')
        end
    end)

    CruiseRoot:action("Revert to Default State", {'cruisedefault'}, "Revert to Default State like Cruise Missile Range and Cooldown.", function() -- Revert Default Settings
        SET_INT_GLOBAL(262145 + 30188, 4000) -- Remove Bypass
        SET_INT_GLOBAL(262145 + 30187, 60000) -- Cooldown Time
        CruiseToast("> Crusie Missile\nReverted to Default State")
    end)

    ----================----
    --- Credits & GitHub
    ----================----

    CruiseRoot:divider("Others")

    CruiseRoot:action("Request Kosatka", {'cruisekosatka'}, EXECUTION_FUNCTION_WORKING(false), function() -- Call Kosatka (1.66 DLC)
        SET_INT_GLOBAL(2793046 + 954, 1)
    end)

    local CruiseMiscs = CruiseRoot:list("Miscellaneous")
    ----============----
    --- Informations
    ----============----

    CruiseMiscs:divider("Informations")
    CruiseMiscs:action("Version: " ..SCRIPT_VERSION, {}, "", function()end)
    CruiseMiscs:action("Stand Edition: " ..edition_menu, {}, "", function()end)

    ----=======----
    --- Credits
    ----=======----

    CruiseMiscs:divider("Credits")
    local CruiseSTMiscs = CruiseMiscs:list("StealthyAD.#8293 (Developer Cruise Missile)")
    CruiseSTMiscs:hyperlink("Visit my GitHub Page", "https://github.com/StealthyAD/Cruise-Missile")
    CruiseSTMiscs:hyperlink("Join my TikTok", "https://www.tiktok.com/@xstealthyhd")
    
    ----=========----
    --- Resources
    ----=========----

    CruiseMiscs:divider("Resources")
    CruiseMiscs:hyperlink("Stand API", "https://stand.gg/help/lua-api-documentation", "Provides much features & essentials for Lua Scripts.")
    CruiseMiscs:hyperlink("NativeDB", "https://nativedb.dotindustries.dev/natives", "Provided for using GTAV natives.")
