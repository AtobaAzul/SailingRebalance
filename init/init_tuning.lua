local wilson_attack = 34
local TUNING = GLOBAL.TUNING

if GetModConfigData("config_tridentBuff") == 1 or GetModConfigData("config_tridentBuff") == 2 then
    TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    TUNING.TRIDENT.OCEAN_DAMAGE = wilson_attack*2.4
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES
    TUNING.TRIDENT.SPELL.DAMAGE = wilson_attack*3

end

if GetModConfigData("config_easierRockjaws") then
    TUNING.SHARK.DAMAGE = 50 / 3
end

TUNING.MESSAGEBOTTLE_NOTE_CHANCE = GetModConfigData("config_moreTreasure")
TUNING.MODDED_PRESET_TRESHHOLD = GetModConfigData("config_customTreasure")

--beta
if GetModConfigData("config_violentCannons") then
    TUNING.BOAT.BOATCANNON.POWER = 20*1.5
end
TUNING.CANNON_FIREMODE = GetModConfigData("config_cannonFiremode")

if GetModConfigData("config_violentCannons") then
    TUNING.GRAVITY_OFFSET = 41
    TUNING.BOAT.BOATCANNON.SPEED = 2
    TUNING.CANNONBALL_PASS_THROUGH_TIME_BUFFER = 1.5
    TUNING.CANNONBALL_SPLASH_RADIUS = 5
    TUNING.CANNONBALL_DAMAGE = 150
    TUNING.CANNONBALL_RADIUS = 0.75
else
    TUNING.GRAVITY_OFFSET = 0
    TUNING.BOAT.BOATCANNON.SPEED = 1
end

if GetModConfigData("config_betterBumpers") then
    TUNING.BOAT.BUMPERS.KELP.HEALTH = TUNING.BOAT.BUMPERS.KELP.HEALTH*2
    TUNING.BOAT.BUMPERS.SHELL.HEALTH = TUNING.BOAT.BUMPERS.SHELL.HEALTH*2
end