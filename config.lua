Config = {}

Config.EasyReload = true -- Set to false if you want to disable easy reload
Config.AmmoReloadKeybind = 'R'

-- amount of revover ammo per load
Config.AmountRevolverAmmo = 12
Config.AmountRevolverExplosiveAmmo = 10
Config.AmountPistolAmmo = 12
Config.AmountPistolExplosiveAmmo = 10
Config.AmountRifleAmmo = 12
Config.AmountRifleExplosiveAmmo = 10
Config.AmountElephantRifleAmmo = 10
Config.AmountVarmintAmmo = 28
Config.AmountRepeaterAmmo = 12
Config.AmountRepeaterExplosiveAmmo = 10
Config.AmountShotgunAmmo = 12
Config.AmountShotgunIncendiaryAmmo = 7
Config.AmountShotgunExplosiveAmmo = 10
Config.AmountArrowAmmo = 12
Config.AmountThrowablesAmmo = 1

Config.Ammos =
{
    -- Revolvers
    {item = 'ammo_revolver',                    hash = 'AMMO_REVOLVER',                     type = 'ammo'},
    {item = 'ammo_revolver_high_velocity',      hash = 'AMMO_REVOLVER_HIGH_VELOCITY',       type = 'ammo_high_velocity'},
    {item = 'ammo_revolver_split_point',        hash = 'AMMO_REVOLVER_SPLIT_POINT',         type = 'ammo_split_point'},
    {item = 'ammo_revolver_express',            hash = 'AMMO_REVOLVER_EXPRESS',             type = 'ammo_express'},
    {item = 'ammo_revolver_express_explosive',  hash = 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE',   type = 'ammo_express_explosive'},

    -- Pistols
    {item = 'ammo_pistol',                      hash = 'AMMO_PISTOL',                       type = 'ammo'},
    {item = 'ammo_pistol_high_velocity',        hash = 'AMMO_PISTOL_HIGH_VELOCITY',         type = 'ammo_high_velocity'},
    {item = 'ammo_pistol_split_point',          hash = 'AMMO_PISTOL_SPLIT_POINT',           type = 'ammo_split_point'},
    {item = 'ammo_pistol_express',              hash = 'AMMO_PISTOL_EXPRESS',               type = 'ammo_express'},
    {item = 'ammo_pistol_express_explosive',    hash = 'AMMO_PISTOL_EXPRESS_EXPLOSIVE',     type = 'ammo_express_explosive'},

    -- Rifles
    {item = 'ammo_rifle',                       hash = 'AMMO_RIFLE',                        type = 'ammo'},
    {item = 'ammo_rifle_high_velocity',         hash = 'AMMO_RIFLE_HIGH_VELOCITY',          type = 'ammo_high_velocity'},
    {item = 'ammo_rifle_split_point',           hash = 'AMMO_RIFLE_SPLIT_POINT',            type = 'ammo_split_point'},
    {item = 'ammo_rifle_express',               hash = 'AMMO_RIFLE_EXPRESS',                type = 'ammo_express'},
    {item = 'ammo_rifle_express_explosive',     hash = 'AMMO_RIFLE_EXPRESS_EXPLOSIVE',      type = 'ammo_express_explosive'},
    -- Elephant Rifle
    {item = 'ammo_rifle_elephant',              hash = 'AMMO_RIFLE_ELEPHANT',               type = 'ammo'},
    -- Varmint Rifle
    {item = 'ammo_varmint',                     hash = 'AMMO_22',                           type = 'ammo'},
    {item = 'ammo_varmint_tranquilizer',        hash = 'AMMO_22_TRANQUILIZER',              type = 'ammo_tranquilizer'},

    -- Repeaters
    {item = 'ammo_repeater',                    hash = 'AMMO_REPEATER',                     type = 'ammo'},
    {item = 'ammo_repeater_high_velocity',      hash = 'AMMO_REPEATER_HIGH_VELOCITY',       type = 'ammo_high_velocity'},
    {item = 'ammo_repeater_split_point',        hash = 'AMMO_REPEATER_SPLIT_POINT',         type = 'ammo_split_point'},
    {item = 'ammo_repeater_express',            hash = 'AMMO_REPEATER_EXPRESS',             type = 'ammo_express'},
    {item = 'ammo_repeater_express_explosive',  hash = 'AMMO_REPEATER_EXPRESS_EXPLOSIVE',   type = 'ammo_express_explosive'},

    -- Shotguns
    {item = 'ammo_shotgun',                     hash = 'AMMO_SHOTGUN',                      type = 'ammo'},
    {item = 'ammo_shotgun_buckshot_incendiary', hash = 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY',  type = 'ammo_buckshot_incendiary'},
    {item = 'ammo_shotgun_slug',                hash = 'AMMO_SHOTGUN_SLUG',                 type = 'ammo_slug'},
    {item = 'ammo_shotgun_slug_explosive',      hash = 'AMMO_SHOTGUN_SLUG_EXPLOSIVE',       type = 'ammo_slug_explosive'},

    -- Bows
    {item = 'ammo_arrow',                       hash = 'AMMO_ARROW',                        type = 'ammo'},
    {item = 'ammo_arrow_fire',                  hash = 'AMMO_ARROW_FIRE',                   type = 'ammo_fire'},
    {item = 'ammo_arrow_poison',                hash = 'AMMO_ARROW_POISON',                 type = 'ammo_poison'},
    {item = 'ammo_arrow_dynamite',              hash = 'AMMO_ARROW_DYNAMITE',               type = 'ammo_dynamite'}
}