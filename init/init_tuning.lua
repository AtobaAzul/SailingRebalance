local wilson_attack = 34
local TUNING = GLOBAL.TUNING

if GetModConfigData("config_tridentBuff") == 1 then
    TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES
elseif GetModConfigData("config_tridentBuff") == 2 then
    TUNING.TRIDENT.DAMAGE = wilson_attack * 3.0
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES
end

if GetModConfigData("config_easierRockjaws") then
    TUNING.SHARK.DAMAGE = 50 / 3
end

TUNING.MESSAGEBOTTLE_NOTE_CHANCE = GetModConfigData("config_moreTreasure")
TUNING.MODDED_PRESET_TRESHHOLD = GetModConfigData("config_customTreasure")