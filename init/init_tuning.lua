local wilson_attack = 34
local TUNING = GLOBAL.TUNING

if GetModConfigData("config_tridentRework") then
    TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    TUNING.TRIDENT.OCEAN_DAMAGE = wilson_attack * 2.4
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES * 2
    TUNING.TRIDENT.SPELL.DAMAGE = wilson_attack * 1.33
end

if GetModConfigData("config_easierRockjaws") then TUNING.SHARK.DAMAGE = 50 / 3 end

TUNING.MESSAGEBOTTLE_NOTE_CHANCE = GetModConfigData("config_moreTreasure")
TUNING.MODDED_PRESET_TRESHHOLD = GetModConfigData("config_customTreasure")

if GetModConfigData("config_violentCannons") then
    TUNING.CANNONBALLS.ROCK.SPEED = TUNING.CANNONBALLS.ROCK.SPEED * 1.33
    TUNING.CANNONBALLS.ROCK.GRAVITY = TUNING.CANNONBALLS.ROCK.GRAVITY * 1.33

    TUNING.CANNONBALL_RADIUS = TUNING.CANNONBALL_RADIUS * 1.25
    TUNING.CANNONBALL_SPLASH_RADIUS = TUNING.CANNONBALL_SPLASH_RADIUS * 1.33
    TUNING.CANNONBALL_SPLASH_DAMAGE_PERCENT = 1
end

if GetModConfigData("config_betterBumpers") then
    TUNING.BOAT.BUMPERS.KELP.HEALTH = TUNING.BOAT.BUMPERS.KELP.HEALTH * 1.33
    TUNING.BOAT.BUMPERS.SHELL.HEALTH = TUNING.BOAT.BUMPERS.SHELL.HEALTH * 1.33
end

if GetModConfigData("config_easierSeaweed") then TUNING.WATERPLANT.DAMAGE = TUNING.WATERPLANT.DAMAGE * 0.75 end

if GetModConfigData("config_waterplantItemBuff") then TUNING.WATERPLANT.ITEM_DAMAGE = TUNING.WATERPLANT.ITEM_DAMAGE * 1.75 end

-- nautopilot buff
if GetModConfigData("config_nautopilotBuff") then
    TUNING.BOAT.BOAT_MAGNET.MAX_DISTANCE = TUNING.BOAT.BOAT_MAGNET.MAX_DISTANCE * 100
    TUNING.BOAT.BOAT_MAGNET.MAX_VELOCITY = TUNING.BOAT.BOAT_MAGNET.MAX_VELOCITY * 100
    TUNING.BOAT.BOAT_MAGNET.CATCH_UP_SPEED = TUNING.BOAT.BOAT_MAGNET.CATCH_UP_SPEED * 100
end

if GetModConfigData("config_crabkingRework") then
    TUNING.CRABKING_REGEN = TUNING.CRABKING_REGEN * 0.33
    TUNING.CRABKING_REGEN_BUFF = TUNING.CRABKING_REGEN * 0.33
end
