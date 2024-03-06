Config = {}

Config.Debug = false

Config.EasyReload = true -- Set to false if you want to disable easy reload
Config.AmmoReloadKeybind = 'R'

Config.Ammos =
{
    -- Revolvers
    {item = 'ammo_revolver',                    hash = 'AMMO_REVOLVER',                     type = 'ammo',                      reload = 12,    max_ammo = 200, weapon = nil,           group = -1101297303},
    {item = 'ammo_revolver_high_velocity',      hash = 'AMMO_REVOLVER_HIGH_VELOCITY',       type = 'ammo_high_velocity',        reload = 12,    max_ammo = 200, weapon = nil,           group = -1101297303},
    {item = 'ammo_revolver_split_point',        hash = 'AMMO_REVOLVER_SPLIT_POINT',         type = 'ammo_split_point',          reload = 12,    max_ammo = 200, weapon = nil,           group = -1101297303},
    {item = 'ammo_revolver_express',            hash = 'AMMO_REVOLVER_EXPRESS',             type = 'ammo_express',              reload = 12,    max_ammo = 200, weapon = nil,           group = -1101297303},
    {item = 'ammo_revolver_express_explosive',  hash = 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE',   type = 'ammo_express_explosive',    reload = 10,    max_ammo = 10,  weapon = nil,           group = -1101297303},

    -- Pistols
    {item = 'ammo_pistol',                      hash = 'AMMO_PISTOL',                       type = 'ammo',                      reload = 12,    max_ammo = 100, weapon = nil,           group = 416676503},
    {item = 'ammo_pistol_high_velocity',        hash = 'AMMO_PISTOL_HIGH_VELOCITY',         type = 'ammo_high_velocity',        reload = 12,    max_ammo = 100, weapon = nil,           group = 416676503},
    {item = 'ammo_pistol_split_point',          hash = 'AMMO_PISTOL_SPLIT_POINT',           type = 'ammo_split_point',          reload = 12,    max_ammo = 50,  weapon = nil,           group = 416676503},
    {item = 'ammo_pistol_express',              hash = 'AMMO_PISTOL_EXPRESS',               type = 'ammo_express',              reload = 12,    max_ammo = 100, weapon = nil,           group = 416676503},
    {item = 'ammo_pistol_express_explosive',    hash = 'AMMO_PISTOL_EXPRESS_EXPLOSIVE',     type = 'ammo_express_explosive',    reload = 10,    max_ammo = 10,  weapon = nil,           group = 416676503},

    -- Rifles
    {item = 'ammo_rifle',                       hash = 'AMMO_RIFLE',                        type = 'ammo',                      reload = 12,    max_ammo = 100, weapon = nil,           group = {970310034, -1212426201}},
    {item = 'ammo_rifle_high_velocity',         hash = 'AMMO_RIFLE_HIGH_VELOCITY',          type = 'ammo_high_velocity',        reload = 12,    max_ammo = 100, weapon = nil,           group = {970310034, -1212426201}},
    {item = 'ammo_rifle_split_point',           hash = 'AMMO_RIFLE_SPLIT_POINT',            type = 'ammo_split_point',          reload = 12,    max_ammo = 50,  weapon = nil,           group = {970310034, -1212426201}},
    {item = 'ammo_rifle_express',               hash = 'AMMO_RIFLE_EXPRESS',                type = 'ammo_express',              reload = 12,    max_ammo = 100, weapon = nil,           group = {970310034, -1212426201}},
    {item = 'ammo_rifle_express_explosive',     hash = 'AMMO_RIFLE_EXPRESS_EXPLOSIVE',      type = 'ammo_express_explosive',    reload = 10,    max_ammo = 10,  weapon = nil,           group = {970310034, -1212426201}},
    -- Elephant Rifle
    {item = 'ammo_rifle_elephant',              hash = 'AMMO_RIFLE_ELEPHANT',               type = 'ammo',                      reload = 10,    max_ammo = 20,  weapon = -1717423096,   group = 970310034},
    -- Varmint Rifle
    {item = 'ammo_varmint',                     hash = 'AMMO_22',                           type = 'ammo',                      reload = 28,    max_ammo = 100, weapon = -570967010,    group = 970310034},
    {item = 'ammo_varmint_tranquilizer',        hash = 'AMMO_22_TRANQUILIZER',              type = 'ammo_tranquilizer',         reload = 28,    max_ammo = 200, weapon = -570967010,    group = 970310034},

    -- Repeaters
    {item = 'ammo_repeater',                    hash = 'AMMO_REPEATER',                     type = 'ammo',                      reload = 12,    max_ammo = 200, weapon = nil,           group = -594562071},
    {item = 'ammo_repeater_high_velocity',      hash = 'AMMO_REPEATER_HIGH_VELOCITY',       type = 'ammo_high_velocity',        reload = 12,    max_ammo = 200, weapon = nil,           group = -594562071},
    {item = 'ammo_repeater_split_point',        hash = 'AMMO_REPEATER_SPLIT_POINT',         type = 'ammo_split_point',          reload = 12,    max_ammo = 100, weapon = nil,           group = -594562071},
    {item = 'ammo_repeater_express',            hash = 'AMMO_REPEATER_EXPRESS',             type = 'ammo_express',              reload = 12,    max_ammo = 200, weapon = nil,           group = -594562071},
    {item = 'ammo_repeater_express_explosive',  hash = 'AMMO_REPEATER_EXPRESS_EXPLOSIVE',   type = 'ammo_express_explosive',    reload = 10,    max_ammo = 10,  weapon = nil,           group = -594562071},

    -- Shotguns
    {item = 'ammo_shotgun',                     hash = 'AMMO_SHOTGUN',                      type = 'ammo',                      reload = 12,    max_ammo = 60,  weapon = nil,            group = 860033945},
    {item = 'ammo_shotgun_buckshot_incendiary', hash = 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY',  type = 'ammo_buckshot_incendiary',  reload = 7,     max_ammo = 14,  weapon = nil,            group = 860033945},
    {item = 'ammo_shotgun_slug',                hash = 'AMMO_SHOTGUN_SLUG',                 type = 'ammo_slug',                 reload = 12,    max_ammo = 60,  weapon = nil,            group = 860033945},
    {item = 'ammo_shotgun_slug_explosive',      hash = 'AMMO_SHOTGUN_SLUG_EXPLOSIVE',       type = 'ammo_slug_explosive',       reload = 10,    max_ammo = 10,  weapon = nil,            group = 860033945},

    -- Bows
    {item = 'ammo_arrow',                       hash = 'AMMO_ARROW',                        type = 'ammo',                      reload = 12,    max_ammo = 40,  weapon = nil,           group = -1241684019},
    {item = 'ammo_arrow_fire',                  hash = 'AMMO_ARROW_FIRE',                   type = 'ammo_fire',                 reload = 12,    max_ammo = 8,   weapon = nil,           group = -1241684019},
    {item = 'ammo_arrow_poison',                hash = 'AMMO_ARROW_POISON',                 type = 'ammo_poison',               reload = 12,    max_ammo = 8,   weapon = nil,           group = -1241684019},
    {item = 'ammo_arrow_dynamite',              hash = 'AMMO_ARROW_DYNAMITE',               type = 'ammo_dynamite',             reload = 12,    max_ammo = 8,   weapon = nil,           group = -1241684019}
}