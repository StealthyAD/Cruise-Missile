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

local SCRIPT_VERSION = "0.3 bis"
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

    ----===============----
    --- Update Features
    ----===============----

    local default_check_interval = 604800
    local auto_update_config = {
        source_url="https://raw.githubusercontent.com/StealthyAD/Cruise-Missile/main/CruiseMissile.lua",
        script_relpath=SCRIPT_RELPATH,
        switch_to_branch=selected_branch,
        verify_file_begins_with="--",
        check_interval=86400,
        silent_updates=true,
    }

    -- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
    local status, auto_updater = pcall(require, "auto-updater")
    if not status then
        local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
        async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
            function(result, headers, status_code)
                local function parse_auto_update_result(result, headers, status_code)
                    local error_prefix = "Error downloading auto-updater: "
                    if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                    if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                    filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                    local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                    if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                    file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
                end
                auto_update_complete = parse_auto_update_result(result, headers, status_code)
            end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
        async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
        if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
        auto_updater = require("auto-updater")
    end
    if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

    -- Run Auto Update
    auto_updater.run_auto_update({
        source_url="https://raw.githubusercontent.com/StealthyAD/Cruise-Missile/main/CruiseMissile.lua",
        script_relpath=SCRIPT_RELPATH,
        verify_file_begins_with="--"
    })
    auto_updater.run_auto_update(auto_update_config)

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

        CruisePresets:toggle_loop("Cruise Missile Range (9.32 Miles)", {"cruise15km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 9.32 Miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (9.32 Miles)")
            CruiseCommands('damagemultiplier 7500')
            SET_INT_GLOBAL(262145 + 30188, 15000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (9.32 Miles)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop("Cruise Missile Range (18.6 Miles)", {"cruise30km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 18.6 miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (18.6 Miles)")
            CruiseCommands('damagemultiplier 8500')
            SET_INT_GLOBAL(262145 + 30188, 30000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (18.6 Miles)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop("Cruise Missile Range (37.2 Miles)", {"cruise60km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 37.2 Miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (37.2 Miles)")
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 60000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (37.2 Miles)")
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
    CruiseMiscs:action("Check for Update", {'cruiseupdate'}, "The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
    auto_update_config.check_interval = 0
        if auto_updater.run_auto_update(auto_update_config) then
            util.toast("> Cruise Missile\nNo updates found.")
        end
    end)

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

----=============----
--- Loop Function 
----=============----

if not SCRIPT_SILENT_START then
    util.toast("Hello ".. players.get_name(players.user()).. "\nWelcome to Cruise Missile " ..SCRIPT_VERSION)
end
