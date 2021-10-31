Assets = {}

PrefabFiles = {}

--TODO: Stop replacing messagebottletreasures and use a postinit on messagebottletreasuremanager instead.
local multiplayer_attack_modifier = 1
--0.6--0.75
local wilson_attack = 34 * multiplayer_attack_modifier
local config_tridentBuff = GetModConfigData("config_tridentBuff")
local config_sweeterFish = GetModConfigData("config_sweeterFish")
local config_easierSeaweed = GetModConfigData("config_easierSeaweed")
local config_easierRockjaws = GetModConfigData("config_easierRockjaws")
local config_hermitRecipes = GetModConfigData("config_hermitRecipes")
local config_livinglogGators = GetModConfigData("config_livinglogGators")
local config_moreTreasure = GetModConfigData("config_moreTreasure")
local config_foodRebalance = GetModConfigData("config_foodRebalance")
local config_moreKeys = GetModConfigData("config_unlockchestKeys")
local config_moreShells = GetModConfigData("config_moreShells")
local config_pearlRusher = GetModConfigData("config_pearlRusher")
local config_betterMoonstorms = GetModConfigData("config_betterMoonstorms")

local unlockablechest = GLOBAL.KnownModIndex:IsModEnabled("workshop-2400387360")
local faf = GLOBAL.KnownModIndex:IsModEnabled("workshop-1908933602")
local um = GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790")

if config_tridentBuff == 1 then
    AddRecipe(
        "trident",
        {Ingredient("boneshard", 2), Ingredient("gnarwail_horn", 1), Ingredient("twigs", 6)},
        GLOBAL.RECIPETABS.WAR,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        false
    )
    GLOBAL.TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    GLOBAL.TUNING.TRIDENT.USES = GLOBAL.TUNING.TRIDENT.USES + 50
    GLOBAL.TUNING.TRIDENT.SPELL.USE_COUNT = GLOBAL.TUNING.TRIDENT.USES
elseif config_tridentBuff == 2 then
    AddRecipe(
        "trident",
        {Ingredient("boneshard", 3), Ingredient("kelp", 4), Ingredient("twigs", 2)},
        GLOBAL.RECIPETABS.WAR,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        false
    )
    GLOBAL.TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    GLOBAL.TUNING.TRIDENT.USES = GLOBAL.TUNING.TRIDENT.USES + 50
    GLOBAL.TUNING.TRIDENT.SPELL.USE_COUNT = GLOBAL.TUNING.TRIDENT.USES
end

if config_sweeterFish == 1 then
    AddIngredientValues({"oceanfish_medium_9_inv"}, {meat = 0.5, sweetener = 1, honey = 1}, true, true)

    AddPrefabPostInit(
        "oceanfish_medium_9_inv",
        function(inst)
            if inst and components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("honey", 1.0, "fishmeat_small", 1.0)
            end
        end
    )
end

if config_easierSeaweed == 1 then
    modimport("postinit/waterplant_bomb") --Thanks, scrimbles.
    GLOBAL.TUNING.WATERPLANT.DAMAGE = GLOBAL.TUNING.WATERPLANT.DAMAGE * 0.75
    GLOBAL.TUNING.WATERPLANT.ITEM_DAMAGE = GLOBAL.TUNING.WATERPLANT.ITEM_DAMAGE * 1.75
end

if config_easierRockjaws == 1 then
    GLOBAL.TUNING.SHARK.DAMAGE = 50 / 3
end

if config_hermitRecipes == 1 then
    AddRecipe(
        "hermit_boat",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_ONE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "boat_item"
    )
    AddRecipe(
        "hermit_mast",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_ONE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "mast_item"
    )
    AddRecipe(
        "hermit_anchor",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_ONE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "anchor_item"
    )
    AddRecipe(
        "hermit_steeringwheel",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_ONE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "steeringwheel_item"
    )
    AddRecipe(
        "hermit_blueprint",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_THREE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "blueprint"
    )
    AddRecipe(
        "hermit_waterplant",
        {Ingredient("messagebottleempty", 3)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_FIVE,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "waterplant_planter"
    )
    AddRecipe(
        "hermit_cookies",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_SEVEN,
        nil,
        nil,
        true,
        nil,
        nil,
        nil,
        nil,
        nil,
        "pumpkincookie"
    )
    AddRecipe(
        "hermit_patch",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.RECIPETABS.HERMITCRABSHOP,
        GLOBAL.TECH.HERMITCRABSHOP_ONE,
        nil,
        nil,
        true,
        3,
        nil,
        nil,
        nil,
        nil,
        "boatpatch"
    )

    GLOBAL.STRINGS.RECIPE_DESC.WATERPLANT_PLANTER = "Grow your very own Sea Weed."
    GLOBAL.STRINGS.RECIPE_DESC.BLUEPRINT = "Learn new things."
    GLOBAL.STRINGS.RECIPE_DESC.PUMPKINCOOKIE = "Grandma's cookies."

    if uncomp then
        AddRecipe(
            "hermit_umoil",
            {Ingredient("messagebottleempty", 3)},
            GLOBAL.RECIPETABS.HERMITCRABSHOP,
            GLOBAL.TECH.HERMITCRABSHOP_FIVE,
            nil,
            nil,
            true,
            nil,
            nil,
            nil,
            nil,
            nil,
            "diseasecurebomb"
        )
    end
end
-- I *hate* how it doesn't fetch data from other mods, but I guess that's by design.

if config_livinglogGators == 1 then
    AddPrefabPostInit(
        "grassgator",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("livinglog", 1, "livinglog", 1, "livinglog", 0.5)
            end
        end
    )
end

GLOBAL.TUNING.MESSAGEBOTTLE_NOTE_CHANCE = config_moreTreasure

if config_foodRebalance == 1 then
    modimport("postinit/foodpostinit")
    local linguine = {
        "barnaclinguine",
        "barnaclinguine_spice_chili",
        "barnaclinguine_spice_garlic",
        "barnaclinguine_spice_salt",
        "barnaclinguine_spice_sugar"
    }

    if faf then
        for k, v in pairs(linguine) do
            AddPrefabPostInit(
                v,
                function(inst)
                    if inst ~= nil and inst.components.edible ~= nil then
                        inst.components.edible.hungervalue = 150
                        inst.components.edible.healthvalue = 40
                        inst.components.edible.sanityvalue = 33
                    end
                end
            )
        end
    else
        for k, v in pairs(linguine) do
            AddPrefabPostInit(
                v,
                function(inst)
                    if inst ~= nil and inst.components.edible ~= nil then
                        inst.components.edible.hungervalue = 75
                        inst.components.edible.sanityvalue = 15
                        inst.components.edible.healthvalue = 40
                    end
                end
            )
        end
    end

    local pita = {
        "barnaclepita",
        "barnaclepita_spice_chili",
        "barnaclepita_spice_garlic",
        "barnaclepita_spice_salt",
        "barnaclepita_spice_sugar"
    }

    if faf then
        for k, v in pairs(pita) do
            AddPrefabPostInit(
                v,
                function(inst)
                    if inst ~= nil and inst.components.edible ~= nil then
                        inst.components.edible.hungervalue = 37.5
                        inst.components.edible.sanityvalue = 33
                        inst.components.edible.healthvalue = 20
                    end
                end
            )
        end
    else
        for k, v in pairs(pita) do
            AddPrefabPostInit(
                v,
                function(inst)
                    if inst ~= nil and inst.components.edible ~= nil then
                        inst.components.edible.hungervalue = 37.5
                        inst.components.edible.sanityvalue = 15
                        inst.components.edible.healthvalue = 20
                    end
                end
            )
        end
    end

    local fishstew = {
        "seafoodgumbo",
        "seafoodgumbo_spice_chili",
        "seafoodgumbo_spice_garlic",
        "seafoodgumbo_spice_salt",
        "seafoodgumbo_spice_sugar"
    }
    for k, v in pairs(fishstew) do
        AddPrefabPostInit(
            v,
            function(inst)
                if inst ~= nil and inst.components.edible ~= nil then
                    inst.components.edible.hungervalue = 150
                    inst.components.edible.sanityvalue = 5
                    inst.components.edible.healthvalue = 12.5
                end
            end
        )
    end
end
--[[
if config_moreKeys == 1 and  unlockablechest then
    AddPrefabPostInit("shark", function(inst)
      if inst ~= nil then
            inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 0.75)
      end
    end)
    
AddPrefabPostInit("malbatross", function(inst)
SetSharedLootTable( 'malbatross',
{
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'malbatross_beak',                     1.00},
    {'mast_malbatross_item_blueprint',      1.00},
    {'malbatross_feathered_weave_blueprint',1.00},
    {'premiumwateringcan_blueprint',        1.00},
    {'bluegem',                             1},
    {'bluegem',                             1},
    {'bluegem',                             0.3},
    {'yellowgem',                           0.05},
    {'oceanfishingbobber_malbatross_tacklesketch',1.00},
    {'chesspiece_malbatross_sketch',    1.00},
    { "sunkenchest_key", 2.75 },

})
    ------------------------------------------    
    if not TheWorld.ismastersim then
        return
    end
    ------------------------------------------
    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:SetChanceLootTable("malbatross")
    end
end)  
end    
AddPrefabPostInit("shark", function(inst)
    SetSharedLootTable('shark', {
    {'fishmeat',            1.00},
    {'fishmeat',            1.00},
    {'fishmeat',            1.00},
    {'fishmeat',            1.00},
    { "sunkenchest_key", 0.75 },
    })
    ------------------------------------------    
    if not TheWorld.ismastersim then
        return
    end
    ------------------------------------------
    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:SetChanceLootTable("shark")
    end
end)
]]
if config_moreShells == 1 then
    AddPrefabPostInit(
        "cookiecutter",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("cookiecuttershell", 0.75)
            end
        end
    )
end

if config_pearlRusher == 1 then
    GLOBAL.CONSTRUCTION_PLANS["hermithouse_construction3"] = {
        Ingredient("moonrocknugget", 5),
        Ingredient("petals", 15),
        Ingredient("moonglass", 10)
    }
end

if config_betterMoonstorms == 1 then
    AddRecipe(
        "moonstorm_static_item",
        {Ingredient("transistor", 1), Ingredient("moonstorm_spark", 2), Ingredient("goldnugget", 3)},
        GLOBAL.RECIPETABS.REFINE,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        false
    )

    AddPrefabPostInit(
        "alterguardian_phase3",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("moonstorm_static_item_blueprint", 1)
            end
        end
    )

    GLOBAL.STRINGS.RECIPE_DESC.MOONSTORM_STATIC_ITEM = "The power of the moon, contained!"
end
if config_moreKeys == 1 then
    if unlockablechest then
        AddPrefabPostInit(
            "malbatross",
            function(inst)
                if not GLOBAL.TheWorld.ismastersim then
                    return
                end
                inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 1)
                inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 0.25)
            end
        )

        AddPrefabPostInit(
            "shark",
            function(inst)
                if not GLOBAL.TheWorld.ismastersim then
                    return
                end
                inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 0.25)
            end
        )

        AddPrefabPostInit(
            "gnarwail",
            function(inst)
                if not GLOBAL.TheWorld.ismastersim then
                    return
                end
                inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 0.25)
            end
        )
    end
end
