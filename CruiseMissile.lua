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
        fr = { -- French Language (Français)
            ["Restart Script"] = "Redémarrer le Script",
            ["Main Menu"] = "Menu Principal",
            ["Presets"] = "Préréglages",
            ["Cruise Missile Range (9.32 Miles)"] = "Portée du missile de croisière (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Portée du missile de croisière (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Portée du missile de croisière (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Aucune limite de portée de missile de croisière",
            ["Cruise Missile Range"] = "Portée du missile de croisière",
            ["Toggle Cooldown Cruise Missile"] = "Activer/Désactiver le cooldown du missile",
            ["Execute Cruise Missile"] = "Tirer le missile de croisière",
            ["Revert to Default State"] = "Remettre par défaut les paramètres",
            ["Others"] = "Autres",
            ["Request Kosatka"] = "Appeller votre Kosatka",
            ["Miscellaneous"] = "Divers",
            ["Check for Updates"] = "Vérifier les mises à jour",
            ["Provided for using GTAV natives."] = "Fourni en utilisant les natives.",
            ["Provides much features & essentials for Lua Scripts."] = "Fournit beaucoup de fonctionnalités et d'éléments essentiels pour les scripts Lua.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Développeur CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Veuillez fixer une limite d'au moins 99 KM/H (soit 61,5 miles, mesure anglaise)\nExemple : si vous souhaitez une autonomie illimitée, fixez une limite maximale.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "REMARQUE : Pour la détection des indications, il vous indique en fonction de la portée du missile.\n\n- 2 à 4 Km - Missile court\n- 4 à 6 Km - Missile standard\n- 6 à 10 Km - Missile moyen\n- 10 à 19 Km - Missile longue portée\n- Supérieur à 20 Km - Missile très longue portée\n\n- ATTENTION : Changer la session mettra votre missile de croisière par défaut.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Retour à l'état par défaut la portée et le temps de recharge des missiles de croisière.",
            ["Visit my GitHub Page"] = "Visite ma page GitHub",
            ["Join my TikTok"] = "Rejoins mon TikTok",
            ["Informations"] = "Informations",
            ["Credits"] = "Crédits",
            ["Resources"] = "Ressources",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Le script vérifiera automatiquement les mises à jour au plus tard tous les jours, mais vous pouvez vérifier manuellement en utilisant cette option à tout moment.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Redémarrez instantanément le script si vous avez des problèmes liés au script.\nREMARQUE : Il remettra par défaut les paramètres de missiles de croisière.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nPas de mise à jour trouvé.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStatus : Missile à courte portée",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStatus : Missile standard",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStatus : Missile à moyenne portée",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStatus : Missile à longue portée",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStatus : Missile à très longue portée",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nParamètres remis par défaut",
        },

        de = { -- German Language (Deutsch)
            ["Restart Script"] = "Neustart-Skript",
            ["Main Menu"] = "Hauptmenü",
            ["Presets"] = "Einstellungen",
            ["Cruise Missile Range (9.32 Miles)"] = "Reichweite von Cruise Missiles (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Reichweite von Cruise Missiles (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Reichweite von Cruise Missiles (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Reichweite von Cruise Missiles ohne Limit",
            ["Cruise Missile Range"] = "Reichweite von Cruise Missiles",
            ["Toggle Cooldown Cruise Missile"] = "Abklingzeit umschalten Cruise Missile",
            ["Execute Cruise Missile"] = "Cruise Missile abfeuern",
            ["Revert to Default State"] = "Zum Standardzustand zurückkehren",
            ["Others"] = "Andere",
            ["Request Kosatka"] = "Anfrage Kosatka",
            ["Miscellaneous"] = "Diverse",
            ["Check for Updates"] = "Überprüfung auf Aktualisierung",
            ["Provided for using GTAV natives."] = "Vorgesehen für die Verwendung von GTAV-Eingeborenen.",
            ["Provides much features & essentials for Lua Scripts."] = "Bietet viele Funktionen und Grundlagen für Lua-Skripte.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Entwickler CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Stellen Sie sicher, dass der Grenzwert mindestens 99 KM/H (d.h. 61,5 Meilen)\nZum Beispiel: Sie wollen unbegrenzte Reichweite, setzen Sie die max.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "HINWEIS: Bei der Indikationserkennung wird die Reichweite der Rakete angegeben.\n\n- 2 bis 4 km - Kurze Rakete\n- 4 bis 6 km - Standardrakete\n- 6 bis 10 km - Mittlere Rakete\n- 10 bis 19 km - Langstreckenrakete\n- Über 20 km - Extra-Langstreckenrakete\n\nWARNUNG: Wenn Sie die Sitzung ändern, wird Ihre Cruise Missile in den Standardzustand versetzt.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Zurücksetzen auf den Standardzustand wie Reichweite und Abklingzeit von Cruise Missiles.",
            ["Visit my GitHub Page"] = "Besuchen Sie meine Github-Seite",
            ["Join my TikTok"] = "Meinem TikTok beitreten",
            ["Informations"] = "Informationen",
            ["Credits"] = "Impressum",
            ["Resources"] = "Ressourcen",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Das Skript sucht höchstens einmal täglich automatisch nach Aktualisierungen, aber Sie können diese Option auch jederzeit manuell nutzen.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Starten Sie das Skript sofort neu, wenn Sie Probleme haben.\nHINWEIS: Es wird sofort einige Cruise Settings Missile umkehren.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nKeine Updates gefunden.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStatus : Kurzstreckenrakete",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStatus : Standardrakete",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStatus : Mittelstreckenrakete",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStatus : Langstreckenrakete",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStatus : Rakete mit extra großer Reichweite",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nZurückgesetzt auf den Standardzustand",
        },
        es = { -- Spanish Language (Español)
            ["Restart Script"] = "Script de reinicio",
            ["Main Menu"] = "Menú principal",
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
            ["Check for Updates"] = "Comprobar la actualización",
            ["Provided for using GTAV natives."] = "Proporcionado para usar los nativos de GTAV",
            ["Provides much features & essentials for Lua Scripts."] = "Proporciona muchas características y elementos esenciales para scripts Lua.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Desarrollador CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Asegúrate de poner el límite al menos a 99 KM/H (lo que significa 61,5 Millas)\nPor ejemplo: quieres autonomía ilimitada, pon el máximo.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "NOTA: Para la detección de la indicación, se le dice de acuerdo con el rango del misil.\n\n- 2 a 4 Km - Misil Corto\n- 4 a 6 Km - Misil Estándar\n- 6 a 10 Km - Misil Medio\n- 10 a 19 Km - Misil de Largo Alcance\n- Superior a 20 Km - Misil de Alcance Extra Largo\n\nAVISO: Cambiar la sesión pondrá su Misil de Crucero en Estado por Defecto.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Vuelve al estado predeterminado como Alcance y Enfriamiento de misiles de crucero.",
            ["Visit my GitHub Page"] = "Visita mi página de GitHub",
            ["Join my TikTok"] = "Únete a mi TikTok",
            ["Informations"] = "Información",
            ["Credits"] = "Créditos",
            ["Resources"] = "Recursos",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "El script comprobará automáticamente si hay actualizaciones como máximo a diario, pero puede comprobarlo manualmente utilizando esta opción en cualquier momento.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Reinicie instantáneamente el script si tiene algún problema.\nNOTA: Revertirá instantáneamente algunos Misiles de Configuración de Crucero.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nNo se han encontrado actualizaciones.",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nEstatus : Misil de Corto Alcance",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nEstatus : Misil Estándar",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nEstado : Misil de Alcance Medio",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nEstado : Misil Largo Alcance",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nEstado : Misil Extra Largo Alcance",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nVolver al estado por defecto",
        },
        ru = { -- Russian Language (русский)
            ["Restart Script"] = "Сценарий перезапуска",
            ["Main Menu"] = "Главное меню",
            ["Presets"] = "Предустановки",
            ["Cruise Missile Range (9.32 Miles)"] = "Полигон для крылатых ракет (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Полигон для крылатых ракет (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Полигон для крылатых ракет (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Безлимитный полигон для крылатых ракет",
            ["Cruise Missile Range"] = "Полигон для крылатых ракет",
            ["Toggle Cooldown Cruise Missile"] = "Переключить время выдержки крылатой ракеты",
            ["Execute Cruise Missile"] = "Запуск крылатой ракеты",
            ["Revert to Default State"] = "Возврат к состоянию по умолчанию",
            ["Others"] = "Остальные",
            ["Request Kosatka"] = "Запрос Косатка",
            ["Miscellaneous"] = "Разное",
            ["Check for Updates"] = "Проверка обновления",
            ["Provided for using GTAV natives."] = "Обеспечивает использование GTAV natives.",
            ["Provides much features & essentials for Lua Scripts."] = "Предоставляет много возможностей и основ для Lua скриптов.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Разрабо CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Убедитесь, что вы установили предел не менее 99 KM/H (что означает 61,5 миль)\nНапример: вы хотите неограниченный запас хода, установите максимальное значение.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "ПРИМЕЧАНИЕ: Для обнаружения индикации, она сообщает вам в зависимости от дальности ракеты.\n\n- от 2 до 4 Км - короткая ракета\n- от 4 до 6 Км - стандартная ракета\n- от 6 до 10 Км - средняя ракета\n- от 10 до 19 Км - ракета дальнего действия\n- свыше 20 Км - ракета сверхдальнего действия\n\nВНИМАНИЕ: Изменение сессии переведет вашу крылатую ракету в состояние по умолчанию.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Возврат к состоянию по умолчанию, например, дальность и время действия крылатой ракеты.",
            ["Visit my GitHub Page"] = "Посетите мою страницу на GitHub",
            ["Join my TikTok"] = "Присоединяйтесь к моему TikTok",
            ["Informations"] = "Информация",
            ["Credits"] = "Кредиты",
            ["Resources"] = "Ресурсы",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Скрипт будет автоматически проверять наличие обновлений не чаще, чем ежедневно, но вы можете вручную проверять их с помощью этой опции в любое время.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Если возникнут проблемы, перезапустите скрипт.\nПРИМЕЧАНИЕ: Это мгновенно изменит некоторые настройки ракеты.",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nОбновления не найдены",
            ------------- Cruise Range Settings -------------
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nСтатус : Ракета малой дальности",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nСтатус : Стандартная ракета",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nСтатус : Ракета средней дальности",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nСтатус : Ракета большой дальности",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nСтатус : Ракета сверхдальнего действия",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nВозврат к состоянию по умолчанию"
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
