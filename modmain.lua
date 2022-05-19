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


local postinit = {
    "boat",
    "crabking",
    "fishweight",
    "gnarwail",
    "grassgator",
    "malbatross",
    "seasonal_shoals",
    "shark",
    "waterplant_bomb",
}

local init = {
    "food",
    "recipes",
    "tuning",
}

--if not GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790") then

for k, v in ipairs(postinit) do
    modimport("init/postinit/"..v)
end

for k, v in ipairs(init) do
    modimport("init/init_"..v)
end

    local containers = GLOBAL.require("containers")
    containers.params.sunkenchest_royal = containers.params.shadowchester
    STRINGS.NAMES.SUNKENCHEST_ROYAL = "Royal Chest"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUNKENCHEST_ROYAL = "Seems awfully brittle."

--end