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
    {item = 'ammo_revolver', hash = 'AMMO_REVOLVER'},
    {item = 'ammo_revolver_high_velocity', hash = 'AMMO_REVOLVER_HIGH_VELOCITY'},
    {item = 'ammo_revolver_split_point', hash = 'AMMO_REVOLVER_SPLIT_POINT'},
    {item = 'ammo_revolver_express', hash = 'AMMO_REVOLVER_EXPRESS'},
    {item = 'ammo_revolver_express_explosive', hash = 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE'},

    -- Pistols
    {item = 'ammo_pistol', hash = 'AMMO_PISTOL'},
    {item = 'ammo_pistol_high_velocity', hash = 'AMMO_PISTOL_HIGH_VELOCITY'},
    {item = 'ammo_pistol_split_point', hash = 'AMMO_PISTOL_SPLIT_POINT'},
    {item = 'ammo_pistol_express', hash = 'AMMO_PISTOL_EXPRESS'},
    {item = 'ammo_pistol_express_explosive', hash = 'AMMO_PISTOL_EXPRESS_EXPLOSIVE'},

    -- Rifles
    {item = 'ammo_rifle', hash = 'AMMO_RIFLE'},
    {item = 'ammo_rifle_high_velocity', hash = 'AMMO_RIFLE_HIGH_VELOCITY'},
    {item = 'ammo_rifle_split_point', hash = 'AMMO_RIFLE_SPLIT_POINT'},
    {item = 'ammo_rifle_express', hash = 'AMMO_RIFLE_EXPRESS'},
    {item = 'ammo_rifle_express_explosive', hash = 'AMMO_RIFLE_EXPRESS_EXPLOSIVE'},
    -- Elephant Rifle
    {item = 'ammo_rifle_elephant', hash = 'AMMO_RIFLE_ELEPHANT'},
    -- Varmint Rifle
    {item = 'ammo_varmint', hash = 'AMMO_22'},
    {item = 'ammo_varmint_tranquilizer', hash = 'AMMO_22_TRANQUILIZER'},

    -- Repeaters
    {item = 'ammo_repeater', hash = 'AMMO_REPEATER'},
    {item = 'ammo_repeater_high_velocity', hash = 'AMMO_REPEATER_HIGH_VELOCITY'},
    {item = 'ammo_repeater_split_point', hash = 'AMMO_REPEATER_SPLIT_POINT'},
    {item = 'ammo_repeater_express', hash = 'AMMO_REPEATER_EXPRESS'},
    {item = 'ammo_repeater_express_explosive', hash = 'AMMO_REPEATER_EXPRESS_EXPLOSIVE'},

    -- Shotguns
    {item = 'ammo_shotgun', hash = 'AMMO_SHOTGUN'},
    {item = 'ammo_shotgun_buckshot_incendiary', hash = 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY'},
    {item = 'ammo_shotgun_slug', hash = 'AMMO_SHOTGUN_SLUG'},
    {item = 'ammo_shotgun_slug_explosive', hash = 'AMMO_SHOTGUN_SLUG_EXPLOSIVE'},

    -- Bows
    {item = 'ammo_arrow', hash = 'AMMO_ARROW'},
    {item = 'ammo_arrow_fire', hash = 'AMMO_ARROW_FIRE'},
    {item = 'ammo_arrow_poison', hash = 'AMMO_ARROW_POISON'},
    {item = 'ammo_arrow_dynamite', hash = 'AMMO_ARROW_DYNAMITE'}
}