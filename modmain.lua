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
    "boat_bumper",
    "boat_cannon",
    "crabking",
    "gnarwail",
    "grassgator",
    "malbatross",
    "oceanfish_",
    "shark",
    "steeringwheel",
    "waterplant_bomb",
    "cannonballs"
}

local postinit_components = {
    "messagebottlemanager",
    "weighable",
}


local init = {
    "food",
    "recipes",
    "tuning",
}

for k, v in ipairs(postinit_prefabs) do
    modimport("init/postinit/prefabs/"..v)
end

for k, v in ipairs(postinit_components) do
    modimport("init/postinit/components/"..v)
end

for k, v in ipairs(init) do
    modimport("init/init_"..v)
end

modimport("init/postinit/any")

local containers = GLOBAL.require("containers")


if containers.params.sunkenchest_royal == nil then
    containers.params.sunkenchest_royal = containers.params.shadowchester
    STRINGS.NAMES.SUNKENCHEST_ROYAL = "Royal Chest"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUNKENCHEST_ROYAL = "Seems awfully brittle."
end
