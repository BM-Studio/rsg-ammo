local RSGCore = exports['rsg-core']:GetCoreObject()

local Debug = function(data)
    if Config.Debug then
        print(data)
    end
end

------------------------------------------
-- load ammo
------------------------------------------
RegisterNetEvent('rsg-ammo:client:AddAmmo', function(ammotype)

    local ped = PlayerPedId()
    local weapon = Citizen.InvokeNative(0x8425C5F057012DAB, ped)
    local weapongroup = GetWeapontypeGroup(weapon)
    local weaponInHands = exports['rsg-weapons']:weaponInHands()
    local currentSerial = weaponInHands[weapon]
    local max_ammo = 0
    local amount_ammo = 0
    local ammo_type = nil
    local ammo_save = nil
    local ammo_item = nil
    local valid_ammo = false

    if weapon == -1569615261 then
        lib.notify({ title = 'Not Holding a Weapon', type = 'error', duration = 5000 })
        return
    end

    -- Elephant Rifle & Varmint
    for i = 1, #Config.Ammos do
        local ammos = Config.Ammos[i]
        local weapons = ammos.weapon
        local hash = ammos.hash
        local group = ammos.group

        if weapons
        and weapons == weapon
        and ammotype == hash
        and type(group) ~= 'table'
        and weapongroup == group
        then
            max_ammo = ammos.max_ammo
            amount_ammo = ammos.reload
            ammo_type = joaat(hash)
            ammo_save = ammos.type
            ammo_item = ammos.item
            valid_ammo = true

            goto continue

        end
    end

    -- All Other Weapons
    for i = 1, #Config.Ammos do
        local ammos = Config.Ammos[i]
        local weapons = ammos.weapon
        local hash = ammos.hash
        local group = ammos.group

        if type(group) ~= 'table' then
            if not weapons and weapon ~= -570967010 and weapon ~= -1717423096 and ammotype == hash and weapongroup == group then
                max_ammo = ammos.max_ammo
                amount_ammo = ammos.reload
                ammo_type = joaat(hash)
                ammo_save = ammos.type
                ammo_item = ammos.item
                valid_ammo = true

                break
            end
        else
            for a = 1, #group do
                local grouphash = group[a]

                if not weapons and weapon ~= -570967010 and weapon ~= -1717423096 and ammotype == hash and weapongroup == grouphash then
                    max_ammo = ammos.max_ammo
                    amount_ammo = ammos.reload
                    ammo_type = joaat(hash)
                    ammo_save = ammos.type
                    ammo_item = ammos.item
                    valid_ammo = true

                    break
                end
            end
        end
    end

    Debug('ammotype     : '..tostring(ammotype))
    Debug('ammo_save    : '..tostring(ammo_save))
    Debug('weapongroup  : '..tostring(weapongroup))

    ::continue::

    if not valid_ammo then
        lib.notify({ title = 'Wrong Ammo for Weapon', type = 'error', duration = 5000 })
        return
    end

    local currentammo = GetPedAmmoByType(ped, ammo_type)
    local total = currentammo + amount_ammo

    if total <= max_ammo then
        Citizen.InvokeNative(0x106A811C6D3035F3, ped, ammo_type, amount_ammo, 0xCA3454E6)
        TriggerServerEvent('rsg-ammo:server:removeitem', ammo_item, 1)
        TriggerServerEvent('rsg-ammo:server:updateammo', currentSerial, ammo_save, total)
    else
        lib.notify({ title = 'Max Ammo Reached', type = 'error', duration = 5000 })
    end

end)

------------------------------------------
-- update ammo loop
------------------------------------------
CreateThread(function()
    SetWeaponsNoAutoswap(true)
    while true do
        local ped = PlayerPedId()
        local weaponInHands = exports['rsg-weapons']:weaponInHands()
        local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, ped)
        local currentSerial = weaponInHands[heldWeapon]
        if weaponInHands[heldWeapon] ~= nil and heldWeapon ~= -1569615261 then
            local IsGun = Citizen.InvokeNative(0x705BE297EEBDB95D, heldWeapon)
            if IsGun then
                local weaponObject = Citizen.InvokeNative(0x6CA484C9A7377E4F, ped, 1)
                local currenttype = Citizen.InvokeNative(0x7E7B19A4355FEE13, ped, weaponObject)
                local currentammo = GetPedAmmoByType(ped, currenttype)

                -----------------------
                -- revolver ammo
                -----------------------
                for i = 1, #Config.Ammos do
                    local ammos = Config.Ammos[i]
                    local hash = ammos.hash

                    if currenttype == joaat(hash) then
                        local ammotype = ammos.type

                        Debug('hash         : '..tostring(hash))
                        Debug('ammotype     : '..tostring(ammotype))

                        TriggerServerEvent('rsg-ammo:server:updateammo', currentSerial, ammotype, currentammo)

                        break
                    end
                end
            end
        end
        Wait(1000)
    end
end)

------------------------------------------
-- easy reload weapon function
------------------------------------------
function HandleReload()
    
    if not Config.EasyReload then
        return
    end

    local ped = PlayerPedId()
    local weaponHash = Citizen.InvokeNative(0x8425C5F057012DAB, ped)
    if weaponHash and weaponHash ~= -1569615261 then
        local weapon = Citizen.InvokeNative(0x8425C5F057012DAB, ped)
        local weapongroup = GetWeapontypeGroup(weapon)
        local group_revolver = joaat('group_revolver')
        local group_pistol = joaat('group_pistol')
        local group_repeater = joaat('group_repeater')
        local group_rifle = joaat('group_rifle')
        local group_sniper = joaat('group_sniper')
        local group_shotgun = joaat('group_shotgun')

        if weapongroup == group_revolver then
            local ammo1 = RSGCore.Functions.HasItem('ammo_revolver', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_revolver_high_velocity', 1)
            local ammo3 = RSGCore.Functions.HasItem('ammo_revolver_split_point', 1)
            local ammo4 = RSGCore.Functions.HasItem('ammo_revolver_express', 1)
            local ammo5 = RSGCore.Functions.HasItem('ammo_revolver_express_explosive', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REVOLVER')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REVOLVER_HIGH_VELOCITY')
            end
            if ammo3 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REVOLVER_SPLIT_POINT')
            end
            if ammo4 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REVOLVER_EXPRESS')
            end
            if ammo5 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE')
            end
        end

        if weapongroup == group_pistol then
            local ammo1 = RSGCore.Functions.HasItem('ammo_pistol', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_pistol_high_velocity', 1)
            local ammo3 = RSGCore.Functions.HasItem('ammo_pistol_split_point', 1)
            local ammo4 = RSGCore.Functions.HasItem('ammo_pistol_express', 1)
            local ammo5 = RSGCore.Functions.HasItem('ammo_pistol_express_explosive', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_PISTOL')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_PISTOL_HIGH_VELOCITY')
            end
            if ammo3 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_PISTOL_SPLIT_POINT')
            end
            if ammo4 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_PISTOL_EXPRESS')
            end
            if ammo5 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_PISTOL_EXPRESS_EXPLOSIVE')
            end
        end

        if weapongroup == group_repeater then
            local ammo1 = RSGCore.Functions.HasItem('ammo_repeater', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_repeater_high_velocity', 1)
            local ammo3 = RSGCore.Functions.HasItem('ammo_repeater_split_point', 1)
            local ammo4 = RSGCore.Functions.HasItem('ammo_repeater_express', 1)
            local ammo5 = RSGCore.Functions.HasItem('ammo_repeater_express_explosive', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REPEATER')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REPEATER_HIGH_VELOCITY')
            end
            if ammo3 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REPEATER_SPLIT_POINT')
            end
            if ammo4 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REPEATER_EXPRESS')
            end
            if ammo5 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_REPEATER_EXPRESS_EXPLOSIVE')
            end
        end

        if (weapongroup == group_rifle or weapongroup == group_sniper) and weaponHash ~= `weapon_rifle_elephant` and weaponHash ~= `weapon_rifle_varmint` then
            local ammo1 = RSGCore.Functions.HasItem('ammo_rifle', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_rifle_high_velocity', 1)
            local ammo3 = RSGCore.Functions.HasItem('ammo_rifle_split_point', 1)
            local ammo4 = RSGCore.Functions.HasItem('ammo_rifle_express', 1)
            local ammo5 = RSGCore.Functions.HasItem('ammo_rifle_express_explosive', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE_HIGH_VELOCITY')
            end
            if ammo3 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE_SPLIT_POINT')
            end
            if ammo4 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE_EXPRESS')
            end
            if ammo5 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE_EXPRESS_EXPLOSIVE')
            end
        end

        if weapongroup == group_shotgun then
            local ammo1 = RSGCore.Functions.HasItem('ammo_shotgun', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_shotgun_buckshot_incendiary', 1)
            local ammo3 = RSGCore.Functions.HasItem('ammo_shotgun_slug', 1)
            local ammo4 = RSGCore.Functions.HasItem('ammo_shotgun_slug_explosive', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_SHOTGUN')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY')
            end
            if ammo3 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_SHOTGUN_SLUG')
            end
            if ammo4 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_SHOTGUN_SLUG_EXPLOSIVE')
            end
        end

        if weaponHash == `weapon_rifle_elephant` then
            local ammo1 = RSGCore.Functions.HasItem('ammo_rifle_elephant', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_RIFLE_ELEPHANT')
            end
        end
        
        if weaponHash == `weapon_rifle_varmint` then
            local ammo1 = RSGCore.Functions.HasItem('ammo_varmint', 1)
            local ammo2 = RSGCore.Functions.HasItem('ammo_varmint_tranquilizer', 1)
            if ammo1 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_22')
            end
            if ammo2 then
                TriggerEvent('rsg-ammo:client:AddAmmo', 'AMMO_22_TRANQUILIZER')
            end
        end
        
    else
        lib.notify({ title = 'You are not holding a weapon', type = 'error', duration = 5000 })
    end
end

------------------------------------------
-- reload weapon by keybind
------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, RSGCore.Shared.Keybinds[Config.AmmoReloadKeybind]) then
            HandleReload()
        end
    end
end)
