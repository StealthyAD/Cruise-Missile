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
util.require_natives("natives-1660775568")
util.require_natives('natives-1663599433-uno')

----===============----
--- Version Script
----===============----

local SCRIPT_VERSION = "0.32"
local edition_menu = "99.4"

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
            ["Hello "] = "Salut ",
            ["\nWelcome to Cruise Missile "] = "\nBienvenue dans le script Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nPas de mise à jour trouvé.",
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
            ["Hello "] = "Guten Tag ",
            ["\nWelcome to Cruise Missile "] = "\nWillkommen im script Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nKeine Updates gefunden.",
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStatus : Kurzstreckenrakete",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStatus : Standardrakete",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStatus : Mittelstreckenrakete",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStatus : Langstreckenrakete",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStatus : Rakete mit extra großer Reichweite",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nZurückgesetzt auf den Standardzustand",
        },
        it = { -- Italian Language (Italiano)
            ["Restart Script"] = "Script di riavvio",
            ["Main Menu"] = "Menu principale",
            ["Presets"] = "Preset",
            ["Cruise Missile Range (9.32 Miles)"] = "Poligono per missili da crociera (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Poligono per missili da crociera (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Poligono per missili da crociera (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Gamma di missili Cruise senza limiti",
            ["Cruise Missile Range"] = "Poligono per missili Cruise",
            ["Toggle Cooldown Cruise Missile"] = "Alterna il tempo di ricarica del missile da crociera",
            ["Execute Cruise Missile"] = "Eseguire un missile da crociera",
            ["Revert to Default State"] = "Revert to Default State",
            ["Others"] = "Altri",
            ["Request Kosatka"] = "Richiesta Kosatka",
            ["Miscellaneous"] = "Varie",
            ["Check for Updates"] = "Verifica dell'aggiornamento",
            ["Provided for using GTAV natives."] = "Fornito per l'utilizzo dei nativi di GTAV.",
            ["Provides much features & essentials for Lua Scripts."] = "Fornisce molte funzioni ed elementi essenziali per gli script Lua.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Sviluppatore CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Assicuratevi di mettere il limite ad almeno 99 KM/H (che significa 61,5 miglia)\nPer esempio: se volete un'autonomia illimitata, mettete il limite massimo.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "NOTA: Per il rilevamento dell'indicazione, si indica in base alla portata del missile.\n\n- Da 2 a 4 Km - Missile corto\n- Da 4 a 6 Km - Missile standard\n- Da 6 a 10 Km - Missile medio\n- Da 10 a 19 Km - Missile a lunga gittata\n- Superiore a 20 Km - Missile a lunghissima gittata\n\nANNO: la modifica della sessione porterà il missile da crociera allo stato di default.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Ripristino dello stato predefinito, come la gittata e il tempo di recupero dei missili Cruise.",
            ["Visit my GitHub Page"] = "Visita la mia pagina GitHub",
            ["Join my TikTok"] = "Unisciti al mio TikTok",
            ["Informations"] = "Informazioni",
            ["Credits"] = "Crediti",
            ["Resources"] = "Risorse",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "Lo script controlla automaticamente la presenza di aggiornamenti al massimo ogni giorno, ma è possibile controllare manualmente utilizzando questa opzione in qualsiasi momento.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Riavviare immediatamente lo script in caso di problemi.\nNOTA: ripristinerà istantaneamente alcune impostazioni di missili Cruise.",
            ["Hello "] = "Ciao ",
            ["\nWelcome to Cruise Missile "] = "\nBenvenuti a Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nNessun aggiornamento trovato.",
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nStato : Missile a corto raggio",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nStato : Missile Standard",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nStato : Missile a medio raggio",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nStato : Missile a lungo raggio",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nStato : Missile a lunghissima gittata",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nRipristino dello stato predefinito",
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
            ["Hello "] = "Hola ",
            ["\nWelcome to Cruise Missile "] = "\nBienvenido a script Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "> CruiseMissile\nNo se han encontrado actualizaciones.",
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nEstatus : Misil de Corto Alcance",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nEstatus : Misil Estándar",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nEstado : Misil de Alcance Medio",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nEstado : Misil Largo Alcance",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nEstado : Misil Extra Largo Alcance",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nVolver al estado por defecto",
        },
        pt = { -- Portuguese/Brazil Language (Português)
            ["Restart Script"] = "Reiniciar o Roteiro",
            ["Main Menu"] = "Menu principal",
            ["Presets"] = "Predefinições",
            ["Cruise Missile Range (9.32 Miles)"] = "Gama de Mísseis de Cruzeiro (15 KM)",
            ["Cruise Missile Range (18.6 Miles)"] = "Gama de Mísseis de Cruzeiro (30 KM)",
            ["Cruise Missile Range (37.2 Miles)"] = "Gama de Mísseis de Cruzeiro (60 KM)",
            ["Cruise Missile Range (Bypass)"] = "Alcance sem limite de mísseis de cruzeiro",
            ["Cruise Missile Range"] = "Gama de Mísseis de Cruzeiro",
            ["Toggle Cooldown Cruise Missile"] = "Míssil de Cruzeiro de Refrigeração Toggle Cooldown",
            ["Execute Cruise Missile"] = "Míssil de Cruzeiro de Fogo",
            ["Revert to Default State"] = "Regressar ao Estado por defeito",
            ["Others"] = "Regressar ao Estado por defeito",
            ["Request Kosatka"] = "Pedir Kosatka",
            ["Miscellaneous"] = "Diversos",
            ["Check for Updates"] = "Verificar por Actualização",
            ["Provided for using GTAV natives."] = "Fornecido para a utilização de nativos de GTAV.",
            ["Provides much features & essentials for Lua Scripts."] = "Fornece muitas características & essências para Lua Scripts.",
            ["StealthyAD.#8293 (Developer CruiseMissile)"] = "StealthyAD.#8293 (Desenvolvedor CruiseMissile)",
            ["Make sure you put the limit atleast 99 KM/H (which means 61.5 Miles)\nE.G: you want unlimited range, put the max."] = "Certifique-se de colocar o limite no mínimo 99 KM/H (o que significa 61,5 Milhas)\n Por exemplo: pretende um alcance ilimitado, coloque o máximo.",
            ["NOTE: For indication detection, it tells you according to the range of the missile.\n\n- 2 to 4 Km - Short Missile\n- 4 to 6 Km - Standard Missile\n- 6 to 10 Km - Medium Missile\n- 10 to 19 Km - Long Range Missile\n- Superior than 20 Km - Extra Long Range Missile\n\nWARNING: Changing the session will put your Cruise Missile to Default State."] = "NOTA: Para detecção de indicações, diz-lhe de acordo com o alcance do míssil.\n- 2 a 4 Km - Míssil Curto- 4 a 6 Km - Míssil Padrão- 6 a 10 Km - Míssil Médio- 10 a 19 Km - Míssil Longo Alcance Superior a 20 Km - Míssil Extra Longo Alcance: Mudando a sessão colocará o seu Míssil de Cruzeiro no estado por defeito.",
            ["Revert to Default State like Cruise Missile Range and Cooldown."] = "Reverter para o estado por defeito como o Cruise Missile Range e Cooldown.",
            ["Visit my GitHub Page"] = "Visite a minha página GitHub",
            ["Join my TikTok"] = "Junte-se ao meu TikTok",
            ["Informations"] = "Informações",
            ["Credits"] = "Créditos",
            ["Resources"] = "Recursos",
            ["The script will automatically check for updates at most daily, but you can manually check using this option anytime."] = "O script verificará automaticamente as actualizações no máximo diariamente, mas pode verificar manualmente usando esta opção em qualquer altura.",
            ["Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."] = "Reinicie instantaneamente o guião se tiver algum problema.\nNOTA: Irá reverter instantaneamente alguns Mísseis Cruise Settings.",
            ["Hello "] = "Olá ",
            ["\nWelcome to Cruise Missile "] = "\nBem-vindo ao Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "Nenhuma actualização encontrada",
            ["Cruise Missile\nStatus : Short Range Missile"] = "Cruise Missile\nEstado : Míssil de curto alcance",
            ["Cruise Missile\nStatus : Standard Missile"] = "Cruise Missile\nEstado : Míssil padrão",
            ["Cruise Missile\nStatus : Medium Range Missile"] = "Cruise Missile\nEstado : Estado : Míssil de médio alcance",
            ["Cruise Missile\nStatus : Long Range Missile"] = "Cruise Missile\nEstado : Míssil de Longo Alcance",
            ["Cruise Missile\nStatus : Extra Long Range Missile"] = "Cruise Missile\nEstado : Míssil de longo alcance extra",
            ["> CruiseMissile\nReverted to Default State"] = "> CruiseMissile\nRevertido para Estado por defeito",
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
            ["Hello "] = "Привет ",
            ["\nWelcome to Cruise Missile "] = "\nДобро пожаловать в Cruise Missile ",
            ["> CruiseMissile\nNo updates found."] = "Обновления не найдены",
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

    CruiseRoot:action(CruiseTranslate("Restart Script"), {'cruiserestart'}, CruiseTranslate("Restart instantly the script if have any problems.\nNOTE: It will instantly revert some Cruise Settings Missile."), function() -- Restart Script
        SET_INT_GLOBAL(262145 + 30188, 4000) -- Revert Distance Between Kosatka and Cruise Missile
        SET_INT_GLOBAL(262145 + 30187, 60000) -- Revert Cooldown
        util.restart_script()
    end)

    CruiseRoot:divider(CruiseTranslate("Main Menu"))

    ----================----
    --- Cruise Root Presets
    ----================----

    local CruisePresets = CruiseRoot:list(CruiseTranslate("Presets"))

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (9.32 Miles)"), {"cruise15km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 9.32 Miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (9.32 Miles)")
            CruiseCommands('damagemultiplier 7500')
            SET_INT_GLOBAL(262145 + 30188, 15000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (9.32 Miles)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (18.6 Miles)"), {"cruise30km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 18.6 miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (18.6 Miles)")
            CruiseCommands('damagemultiplier 8500')
            SET_INT_GLOBAL(262145 + 30188, 30000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (18.6 Miles)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (37.2 Miles)"), {"cruise60km"}, EXECUTION_FUNCTION_WORKING(false), function() -- 37.2 Miles Cruise Missile Range
            CruiseHelp("Cruise Missile\nStatus : Active (37.2 Miles)")
            CruiseCommands('damagemultiplier 10000')
            SET_INT_GLOBAL(262145 + 30188, 60000)
        end, function()
            CruiseHelp("Cruise Missile\nStatus : Inactive (37.2 Miles)")
            CruiseCommands('damagemultiplier 1')
            SET_INT_GLOBAL(262145 + 30188, 4000)
        end)

        CruisePresets:toggle_loop(CruiseTranslate("Cruise Missile Range (Bypass)"), {"cruisebypass"}, EXECUTION_FUNCTION_WORKING(false), function() -- Bypass Cruise Missile Range
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
            CruiseHelp("Cruise Missile\nStatus : Standard Missile")
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
    CruiseMiscs:action("Version: " ..SCRIPT_VERSION, {}, "", function()end)
    CruiseMiscs:action("Stand Edition: " ..edition_menu, {}, "", function()end)
    CruiseMiscs:action(CruiseTranslate("Check for Update"), {'cruiseupdate'}, CruiseTranslate("The script will automatically check for updates at most daily, but you can manually check using this option anytime."), function()
    auto_update_config.check_interval = 0
        if auto_updater.run_auto_update(auto_update_config) then
            util.toast(CruiseTranslate("> CruiseMissile\nNo updates found."))
        end
    end)

    ----=======----
    --- Credits
    ----=======----

    CruiseMiscs:divider("Credits")
    local CruiseSTMiscs = CruiseMiscs:list(CruiseTranslate("StealthyAD.#8293 (Developer CruiseMissile)"))
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

    if not SCRIPT_SILENT_START then
        util.toast(CruiseTranslate("Hello ").. players.get_name(players.user()).. CruiseTranslate("\nWelcome to Cruise Missile ") ..SCRIPT_VERSION)
    end
