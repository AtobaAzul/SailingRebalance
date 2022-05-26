Assets = {
	Asset("ATLAS", "images/inventoryimages/diseasecurebomb.xml"),
	Asset("IMAGE", "images/inventoryimages/diseasecurebomb.tex"),
    Asset("ANIM", "anim/sunken_royalchest.zip")
}

PrefabFiles = {
    "sunkenchest_royal",
}

GLOBAL.require("recipe")
TechTree = GLOBAL.require("techtree")
TECH = GLOBAL.TECH
Recipe = GLOBAL.Recipe
RECIPETABS = GLOBAL.RECIPETABS
Ingredient = GLOBAL.Ingredient
AllRecipes = GLOBAL.AllRecipes
TUNING = GLOBAL.TUNING
STRINGS = GLOBAL.STRINGS


local postinit_prefabs = {
    "boat",
    "crabking",
    "gnarwail",
    "grassgator",
    "malbatross",
    "seasonal_shoals",
    "shark",
    "waterplant_bomb",
}
local postinit_components = {
    "weighable",
    "messagebottlemanager"
}
local init = {
    "food",
    "recipes",
    "tuning",
}

--if not GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790") then

for k, v in ipairs(postinit_prefabs) do
    modimport("init/postinit/prefabs/"..v)
end

for k, v in ipairs(postinit_components) do
    modimport("init/postinit/components/"..v)
end

for k, v in ipairs(init) do
    modimport("init/init_"..v)
end

    local containers = GLOBAL.require("containers")
    containers.params.sunkenchest_royal = containers.params.shadowchester
    STRINGS.NAMES.SUNKENCHEST_ROYAL = "Royal Chest"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUNKENCHEST_ROYAL = "Seems awfully brittle."

--end