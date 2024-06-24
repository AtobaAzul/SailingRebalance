Assets = {Asset("ATLAS", "images/inventoryimages/diseasecurebomb.xml"), Asset("IMAGE", "images/inventoryimages/diseasecurebomb.tex"), Asset("ANIM", "anim/sunken_royalchest.zip")}

PrefabFiles = {"sunkenchest_royal", "sunkenchest_spawner", "crabking_geyser_single", "trident_ground_fx"}

GLOBAL.require("recipe")
TechTree = GLOBAL.require("techtree")
TECH = GLOBAL.TECH
Recipe = GLOBAL.Recipe
RECIPETABS = GLOBAL.RECIPETABS
Ingredient = GLOBAL.Ingredient
AllRecipes = GLOBAL.AllRecipes
TUNING = GLOBAL.TUNING
STRINGS = GLOBAL.STRINGS

local postinit_prefabs = {"boat_bumper", "oceanfish_", "waterplant_bomb", "trident", "boat_pirate", "slurtle_shellpieces", "crabking", "crabking_claw"}

local postinit_prefabs_um = { -- these features work with UM.
    "gnarwail",
    "grassgator",
    "malbatross",
    "shark",
    "steeringwheel"
}

local postinit_components = {"messagebottlemanager", "weighable", "hullhealth", "boatphysics", "combat"}

local init = {"food", "recipes", "tuning"}

if not GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790") then

    for k, v in ipairs(postinit_prefabs) do modimport("init/postinit/prefabs/" .. v) end

    for k, v in ipairs(postinit_components) do modimport("init/postinit/components/" .. v) end

    modimport("init/postinit/stategraphs/SGcrabkingclaw")

    local containers = GLOBAL.require("containers")

    if containers.params.sunkenchest_royal == nil then
        containers.params.sunkenchest_royal = containers.params.shadowchester
        STRINGS.NAMES.SUNKENCHEST_ROYAL = "Royal Chest"
        STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUNKENCHEST_ROYAL = "Seems awfully brittle."
    end

else
    print("WARNING: Sailing Rebalance has been merged into Uncompromising Mode! Most SR features are overwritten.")
end

for k, v in ipairs(init) do modimport("init/init_" .. v) end

for k, v in ipairs(postinit_prefabs_um) do modimport("init/postinit/prefabs/" .. v) end

modimport("init/postinit/components/drownable")
