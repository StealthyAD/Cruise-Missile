-----===========================-----
----    Cruise Missile for Stand
----        by StealthyAD
----    Breaking the Boundaries
---- of the border for cruise missile
----    Multi-Language Include
-----===========================-----

----=============----
--- Natives Stand
----=============----

util.keep_running()
util.require_natives(1663599433)

----===============----
--- Version Script
----===============----

local SCRIPT_VERSION = "0.34.6"

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

----=====================----
--- Translations Features
----=====================----

    user_lang = lang.get_current()
    local en_table = {"en","en-us","hornyuwu","uwu","sex"}
    local english
    local supported_lang
    for _,lang in pairs(en_table) do
        if user_lang == lang then
            english = true
            supported_lang = true
            break
        end
    end

    if not supported_lang then
        local SupportedLang = function()
            local supported_lang_table = {"fr", "de", "it", "es", "pt", "ru"}
            for _,tested_lang in pairs(supported_lang_table) do
                if tested_lang == user_lang then
                    supported_lang = true
                    return
                end
            end
            english = true
            util.toast("> Cruise Missile\nSorry your language isn't supported. Script language set to English.")
        end
        SupportedLang()
    end

    local tr_table = {
        fr = { -- French Language (Fran??ais)
            ["Restart Script"] = "Red??marrer le Script",
            ["Main Menu"] = "Menu Principal",
            ["Presets"] = "Pr??r??glages",
            ["Cruise Missile Range (9.32 Miles)"] = "Port??e du missile de croisi??re (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Port??e du missile de croisi??re (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Port??e du missile de croisi??re (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Aucune limite de port??e de missile de croisi??re",
            ["Cruise Missile Range"] = "Port??e du missile de croisi??re",
            ["Toggle Cooldown Cruise Missile"] = "Activer/D??sactiver le cooldown du missile",
            ["Execute Cruise Missile"] = "Tirer le missile de croisi??re",
            ["Revert to Default State"] = "Remettre par d??faut les param??tres",
            ["Others"] = "Autres",
            ["Request Kosatka"] = "Appeller votre Kosatka",
            ["Miscellaneous"] = "Divers",
            ["Check for Updates"] = "V??rifier les mises ?? jour",
            ["Provided for using GTAV natives."] = "Fourni en utilisant les natives.",
            ["Provides much features & essentials for Lua Scripts."] = "Fournit beaucoup de fonctionnalit??s et d'??l??ments essentiels pour les scripts Lua.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (D??veloppeur CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Veuillez fixer une limite d'au moins 99 KM/H (soit 61,5 miles, mesure anglaise)\nExemple : si vous souhaitez une autonomie illimit??e, fixez une limite maximale.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "REMARQUE : Pour la d??tection des indications, il vous indique en fonction de la port??e du missile.\n\n- 2 ?? 4 Km - Missile court\n- 4 ?? 6 Km - Missile standard\n- 6 ?? 10 Km - Missile moyen\n- 10 ?? 19 Km - Missile longue port??e\n- Sup??rieur ?? 20 Km - Missile tr??s longue port??e\n\n- ATTENTION : Changer la session mettra votre missile de croisi??re par d??faut.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Retour ?? l'??tat par d??faut la port??e et le temps de recharge des missiles de croisi??re.",
            ["Visit my GitHub Page"] = "Visite ma page GitHub",
            ["Join my TikTok"] = "Rejoins mon TikTok",
            ["Informations"] = "Informations",
            ["Credits"] = "Cr??dits",
            ["Resources"] = "Ressources",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Le script v??rifiera automatiquement les mises ?? jour au plus tard tous les jours, mais vous pouvez v??rifier manuellement en utilisant cette option ?? tout moment.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Red??marrez instantan??ment le script si vous avez des probl??mes li??s au script.\nREMARQUE : Il remettra par d??faut les param??tres de missiles de croisi??re.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nPas de mise ?? jour trouv??.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStatus : Missile ?? courte port??e",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStatus : Missile standard",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStatus : Missile ?? moyenne port??e",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStatus : Missile ?? longue port??e",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStatus : Missile ?? tr??s longue port??e",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nParam??tres remis par d??faut",
        },

        de = { -- German Language (Deutsch)
            ["Restart Script"] = "Neustart-Skript",
            ["Main Menu"] = "Hauptmen??",
            ["Presets"] = "Einstellungen",
            ["Cruise Missile Range (9.32 Miles)"] = "Reichweite von Cruise Missiles (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Reichweite von Cruise Missiles (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Reichweite von Cruise Missiles (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Reichweite von Cruise Missiles ohne Limit",
            ["Cruise Missile Range"] = "Reichweite von Cruise Missiles",
            ["Toggle Cooldown Cruise Missile"] = "Abklingzeit umschalten Cruise Missile",
            ["Execute Cruise Missile"] = "Cruise Missile abfeuern",
            ["Revert to Default State"] = "Zum Standardzustand zur??ckkehren",
            ["Others"] = "Andere",
            ["Request Kosatka"] = "Anfrage Kosatka",
            ["Miscellaneous"] = "Diverse",
            ["Check for Updates"] = "??berpr??fung auf Aktualisierung",
            ["Provided for using GTAV natives."] = "Vorgesehen f??r die Verwendung von GTAV-Eingeborenen.",
            ["Provides much features & essentials for Lua Scripts."] = "Bietet viele Funktionen und Grundlagen f??r Lua-Skripte.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Entwickler CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Stellen Sie sicher, dass der Grenzwert mindestens 99 KM/H (d.h. 61,5 Meilen)\nZum Beispiel: Sie wollen unbegrenzte Reichweite, setzen Sie die max.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "HINWEIS: Bei der Indikationserkennung wird die Reichweite der Rakete angegeben.\n\n- 2 bis 4 km - Kurze Rakete\n- 4 bis 6 km - Standardrakete\n- 6 bis 10 km - Mittlere Rakete\n- 10 bis 19 km - Langstreckenrakete\n- ??ber 20 km - Extra-Langstreckenrakete\n\nWARNUNG: Wenn Sie die Sitzung ??ndern, wird Ihre Cruise Missile in den Standardzustand versetzt.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Zur??cksetzen auf den Standardzustand wie Reichweite und Abklingzeit von Cruise Missiles.",
            ["Visit my GitHub Page"] = "Besuchen Sie meine Github-Seite",
            ["Join my TikTok"] = "Meinem TikTok beitreten",
            ["Informations"] = "Informationen",
            ["Credits"] = "Impressum",
            ["Resources"] = "Ressourcen",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Das Skript sucht h??chstens einmal t??glich automatisch nach Aktualisierungen, aber Sie k??nnen diese Option auch jederzeit manuell nutzen.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Starten Sie das Skript sofort neu, wenn Sie Probleme haben.\nHINWEIS: Es wird sofort einige Cruise Settings Missile umkehren.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nKeine Updates gefunden.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStatus : Kurzstreckenrakete",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStatus : Standardrakete",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStatus : Mittelstreckenrakete",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStatus : Langstreckenrakete",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStatus : Rakete mit extra gro??er Reichweite",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nZur??ckgesetzt auf den Standardzustand",
        },
        es = { -- Spanish Language (Espa??ol)
            ["Restart Script"] = "Script de reinicio",
            ["Main Menu"] = "Men?? principal",
            ["Presets"] = "Preselecciones",
            ["Cruise Missile Range (9.32 Miles)"] = "Alcance de los misiles de crucero (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Alcance de los misiles de crucero (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Alcance de los misiles de crucero (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Alcance ilimitado de los misiles de crucero",
            ["Cruise Missile Range"] = "Alcance de los misiles de crucero",
            ["Toggle Cooldown Cruise Missile"] = "Alternar Enfriamiento Misil Crucero",
            ["Execute Cruise Missile"] = "Disparar misil de crucero",
            ["Revert to Default State"] = "Volver al estado por defecto",
            ["Others"] = "Otros",
            ["Request Kosatka"] = "Solicitud Kosatka",
            ["Miscellaneous"] = "Varios",
            ["Check for Updates"] = "Comprobar la actualizaci??n",
            ["Provided for using GTAV natives."] = "Proporcionado para usar los nativos de GTAV",
            ["Provides much features & essentials for Lua Scripts."] = "Proporciona muchas caracter??sticas y elementos esenciales para scripts Lua.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Desarrollador CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Aseg??rate de poner el l??mite al menos a 99 KM/H (lo que significa 61,5 Millas)\nPor ejemplo: quieres autonom??a ilimitada, pon el m??ximo.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "NOTA: Para la detecci??n de la indicaci??n, se le dice de acuerdo con el rango del misil.\n\n- 2 a 4 Km - Misil Corto\n- 4 a 6 Km - Misil Est??ndar\n- 6 a 10 Km - Misil Medio\n- 10 a 19 Km - Misil de Largo Alcance\n- Superior a 20 Km - Misil de Alcance Extra Largo\n\nAVISO: Cambiar la sesi??n pondr?? su Misil de Crucero en Estado por Defecto.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Vuelve al estado predeterminado como Alcance y Enfriamiento de misiles de crucero.",
            ["Visit my GitHub Page"] = "Visita mi p??gina de GitHub",
            ["Join my TikTok"] = "??nete a mi TikTok",
            ["Informations"] = "Informaci??n",
            ["Credits"] = "Cr??ditos",
            ["Resources"] = "Recursos",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "El script comprobar?? autom??ticamente si hay actualizaciones como m??ximo a diario, pero puede comprobarlo manualmente utilizando esta opci??n en cualquier momento.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Reinicie instant??neamente el script si tiene alg??n problema.\nNOTA: Revertir?? instant??neamente algunos Misiles de Configuraci??n de Crucero.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nNo se han encontrado actualizaciones.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nEstatus : Misil de Corto Alcance",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nEstatus : Misil Est??ndar",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nEstado : Misil de Alcance Medio",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nEstado : Misil Largo Alcance",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nEstado : Misil Extra Largo Alcance",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nVolver al estado por defecto",
        },
        ru = { -- Russian Language (??????????????)
            ["Restart Script"] = "???????????????? ??????????????????????",
            ["Main Menu"] = "?????????????? ????????",
            ["Presets"] = "??????????????????????????",
            ["Cruise Missile Range (9.32 Miles)"] = "?????????????? ?????? ???????????????? ?????????? (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "?????????????? ?????? ???????????????? ?????????? (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "?????????????? ?????? ???????????????? ?????????? (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "?????????????????????? ?????????????? ?????? ???????????????? ??????????",
            ["Cruise Missile Range"] = "?????????????? ?????? ???????????????? ??????????",
            ["Toggle Cooldown Cruise Missile"] = "?????????????????????? ?????????? ???????????????? ???????????????? ????????????",
            ["Execute Cruise Missile"] = "???????????? ???????????????? ????????????",
            ["Revert to Default State"] = "?????????????? ?? ?????????????????? ???? ??????????????????",
            ["Others"] = "??????????????????",
            ["Request Kosatka"] = "???????????? ??????????????",
            ["Miscellaneous"] = "????????????",
            ["Check for Updates"] = "???????????????? ????????????????????",
            ["Provided for using GTAV natives."] = "???????????????????????? ?????????????????????????? GTAV natives.",
            ["Provides much features & essentials for Lua Scripts."] = "?????????????????????????? ?????????? ???????????????????????? ?? ?????????? ?????? Lua ????????????????.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (?????????????? CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "??????????????????, ?????? ???? ???????????????????? ???????????? ???? ?????????? 99 KM/H (?????? ???????????????? 61,5 ????????)\n????????????????: ???? ???????????? ???????????????????????????? ?????????? ????????, ???????????????????? ???????????????????????? ????????????????.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "????????????????????: ?????? ?????????????????????? ??????????????????, ?????? ???????????????? ?????? ?? ?????????????????????? ???? ?????????????????? ????????????.\n\n- ???? 2 ???? 4 ???? - ???????????????? ????????????\n- ???? 4 ???? 6 ???? - ?????????????????????? ????????????\n- ???? 6 ???? 10 ???? - ?????????????? ????????????\n- ???? 10 ???? 19 ???? - ???????????? ???????????????? ????????????????\n- ?????????? 20 ???? - ???????????? ?????????????????????????? ????????????????\n\n????????????????: ?????????????????? ???????????? ?????????????????? ???????? ???????????????? ???????????? ?? ?????????????????? ???? ??????????????????.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "?????????????? ?? ?????????????????? ???? ??????????????????, ????????????????, ?????????????????? ?? ?????????? ???????????????? ???????????????? ????????????.",
            ["Visit my GitHub Page"] = "???????????????? ?????? ???????????????? ???? GitHub",
            ["Join my TikTok"] = "?????????????????????????????? ?? ?????????? TikTok",
            ["Informations"] = "????????????????????",
            ["Credits"] = "??????????????",
            ["Resources"] = "??????????????",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "???????????? ?????????? ?????????????????????????? ?????????????????? ?????????????? ???????????????????? ???? ????????, ?????? ??????????????????, ???? ???? ???????????? ?????????????? ?????????????????? ???? ?? ?????????????? ???????? ?????????? ?? ?????????? ??????????.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "???????? ?????????????????? ????????????????, ?????????????????????????? ????????????.\n????????????????????: ?????? ?????????????????? ?????????????? ?????????????????? ?????????????????? ????????????.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\n???????????????????? ???? ??????????????",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\n???????????? : ???????????? ?????????? ??????????????????",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\n???????????? : ?????????????????????? ????????????",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\n???????????? : ???????????? ?????????????? ??????????????????",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\n???????????? : ???????????? ?????????????? ??????????????????",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\n???????????? : ???????????? ?????????????????????????? ????????????????",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\n?????????????? ?? ?????????????????? ???? ??????????????????"
        }
    }

    CruiseTranslate = function(str)
        if not english then
            local cruisetranslate_str = tr_table[user_lang][str]
            if cruisetranslate_str == nil or cruisetranslate_str == "" then
                util.toast("> Cruise Missile (translation missing) : '"..str.."'",TOAST_CONSOLE)
            else
                return cruisetranslate_str
            end
        end
        return str
    end

----================----
--- Main Cruise Root
----================----

    CruiseRoot:divider(CruiseTranslate("Main Menu"))

    ----================----
    --- Cruise Root Presets
    ----================----

    local CruisePresets = CruiseRoot:list(CruiseTranslate("Presets"))

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (9.32 Miles)"), {"cruise15km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 9.32 Miles Cruise Missile Range
            CruiseCommands('damagemultiplier 7500')
            SET_INT_GLOBAL(262145 + 30188, 15000)
        end, function()
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (18.6 Miles)"), {"cruise30km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 18.6 miles Cruise Missile Range
            CruiseCommands('damagemultiplier 8500')
            SET_INT_GLOBAL(262145 + 30188, 30000)
        end, function()
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (37.2 Miles)"), {"cruise60km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 37.2 Miles Cruise Missile Range
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 60000)
        end, function()
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (Bypass)"), {"cruisebypass"}, EXECUTION_FUNCTION_WORKING(false), function() -- Bypass Cruise Missile Range
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 99999)
        end, function()
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

    ----===================----
    --- Cruise Root Presets
    ----===================----

    CruiseMissileFire = CruiseRoot:slider(CruiseTranslate("Cruise Missile Range"), {"cruisemissilerange"}, CruiseTranslate("Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."), 2, 99, 4, 1, function()end) -- Maximise your chance to hit enemy to high range

    CruiseRoot:toggle_loop(CruiseTranslate("Toggle Cooldown Cruise Missile"), {'cruisemissilecooldown'}, EXECUTION_FUNCTION_WORKING(false), function()
        SET_INT_GLOBAL(262145 + 30187, 0)
    end,function()
        SET_INT_GLOBAL(262145 + 30187, 60000)
    end)

    CruiseRoot:action(CruiseTranslate("Execute Cruise Missile"), {"cruisemissilefire"}, CruiseTranslate("NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."), function()
        SET_INT_GLOBAL(262145 + 30188, menu.get_value(CruiseMissileFire) * 1000)

        if menu.get_value(CruiseMissileFire) >= 20 then -- Extra Long Range Range Missile
            CruiseHelp(CruiseTranslate("Cruise Missile\nStatus : Extra Long Range Missile"))
            CruiseCommands('damagemultiplier 10000')
        end

        if menu.get_value(CruiseMissileFire) >= 10 and menu.get_value(CruiseMissileFire) <= 19 then -- Long Range Missile
            CruiseHelp(CruiseTranslate("Cruise Missile\nStatus : Long Range Missile"))
            CruiseCommands('damagemultiplier 7500')
        end

        if menu.get_value(CruiseMissileFire) >=6 and menu.get_value(CruiseMissileFire) <= 9 then -- Medium Range Missile
            CruiseHelp(CruiseTranslate("Cruise Missile\nStatus : Medium Range Missile"))
            CruiseCommands('damagemultiplier 10000')
        end

        if menu.get_value(CruiseMissileFire) >= 4 and menu.get_value(CruiseMissileFire) <= 5 then -- Standard Missile
            CruiseHelp(CruiseTranslate("Cruise Missile\nStatus : Standard Missile"))
            CruiseCommands('damagemultiplier 1')
        end
        if menu.get_value(CruiseMissileFire) >= 2 and menu.get_value(CruiseMissileFire) <= 3 then -- Short Range Missile
            CruiseHelp(CruiseTranslate("Cruise Missile\nStatus : Short Range Missile"))
            CruiseCommands('damagemultiplier 1')
        end
    end)

    CruiseRoot:action(CruiseTranslate("Revert to Default State"), {'cruisedefault'}, CruiseTranslate("Revert to Default State like Cruise Missile Range and Cooldown."), function() -- Revert Default Settings
        SET_INT_GLOBAL(262145 + 30188, 4000) -- Remove Bypass
        SET_INT_GLOBAL(262145 + 30187, 60000) -- Cooldown Time
        CruiseToast(CruiseTranslate("> CruiseMissile\nReverted to Default State"))
    end)

    ----================----
    --- Credits & GitHub
    ----================----

    CruiseRoot:divider(CruiseTranslate("Others"))

    CruiseRoot:action(CruiseTranslate("Request Kosatka"), {'cruisekosatka'}, EXECUTION_FUNCTION_WORKING(false), function() -- Call Kosatka (1.66 DLC)
        SET_INT_GLOBAL(2793046 + 954, 1)
    end)

    local CruiseMiscs = CruiseRoot:list(CruiseTranslate("Miscellaneous"))
    ----============----
    --- Informations
    ----============----

    CruiseMiscs:divider(CruiseTranslate("Informations"))
    CruiseMiscs:readonly("Version: " ..SCRIPT_VERSION)
    CruiseMiscs:action(CruiseTranslate("Check for Updates"), {'cruiseupdate'}, CruiseTranslate("The script will automatically check for updates at most daily, but you can manually check using this option anytime."), function()
    auto_update_config.check_interval = 0
        if auto_updater.run_auto_update(auto_update_config) then
            util.toast(CruiseTranslate("> CruiseMissile\nNo updates found."))
        end
    end)

    ----=======----
    --- Credits
    ----=======----

    CruiseMiscs:divider("Credits")
    local CruiseSTMiscs = CruiseMiscs:list(CruiseTranslate("StealthyAD."))
    CruiseSTMiscs:hyperlink("GitHub Profile", "https://github.com/StealthyAD")
    CruiseSTMiscs:hyperlink(CruiseTranslate("Visit my GitHub Page"), "https://github.com/StealthyAD/Cruise-Missile")
    CruiseSTMiscs:hyperlink(CruiseTranslate("Join my TikTok"), "https://www.tiktok.com/@xstealthyhd")
    
    ----=========----
    --- Resources
    ----=========----

    CruiseMiscs:divider(CruiseTranslate("Resources"))
    CruiseMiscs:hyperlink("Stand API", "https://stand.gg/help/lua-api-documentation", CruiseTranslate("Provides much features & essentials for Lua Scripts."))
    CruiseMiscs:hyperlink("NativeDB", "https://nativedb.dotindustries.dev/natives", CruiseTranslate("Provided for using GTAV natives."))

----=============----
--- Loop Function 
----=============----

    util.on_stop(function()
        SET_INT_GLOBAL(262145 + 30188, 4000) -- Revert Distance Between Kosatka and Cruise Missile
        SET_INT_GLOBAL(262145 + 30187, 60000) -- Revert Cooldown
    end)
