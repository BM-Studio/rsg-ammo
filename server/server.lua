local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-ammo/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-- Usable Iems
CreateThread(function()
    for i = 1, #Config.Ammos do
        local ammo = Config.Ammos[i]
        local item = ammo.item
        local hash = ammo.hash

        RSGCore.Functions.CreateUseableItem(item, function(source)
            TriggerClientEvent('rsg-ammo:client:AddAmmo', source, hash)
        end)
    end
end)

------------------------------------------
-- update ammo
------------------------------------------
RegisterServerEvent('rsg-ammo:server:updateammo', function(serial, ammotype, ammo)
    if ammotype == 'ammo' then
        MySQL.update('UPDATE player_weapons SET ammo = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_express' then
        MySQL.update('UPDATE player_weapons SET ammo_express = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_express_explosive' then
        MySQL.update('UPDATE player_weapons SET ammo_express_explosive = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_high_velocity' then
        MySQL.update('UPDATE player_weapons SET ammo_high_velocity = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_split_point' then
        MySQL.update('UPDATE player_weapons SET ammo_split_point = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_buckshot_incendiary' then
        MySQL.update('UPDATE player_weapons SET ammo_buckshot_incendiary = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_slug' then
        MySQL.update('UPDATE player_weapons SET ammo_slug = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_slug_explosive' then
        MySQL.update('UPDATE player_weapons SET ammo_slug_explosive = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_tranquilizer' then
        MySQL.update('UPDATE player_weapons SET ammo_tranquilizer = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_fire' then
        MySQL.update('UPDATE player_weapons SET ammo_fire = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_poison' then
        MySQL.update('UPDATE player_weapons SET ammo_poison = ? WHERE serial = ?', { ammo, serial })
    end
    if ammotype == 'ammo_dynamite' then
        MySQL.update('UPDATE player_weapons SET ammo_dynamite = ? WHERE serial = ?', { ammo, serial })
    end
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rsg-ammo:server:removeitem')
AddEventHandler('rsg-ammo:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()