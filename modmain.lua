Assets = {
	Asset("ATLAS", "images/inventoryimages/diseasecurebomb.xml"),
	Asset("IMAGE", "images/inventoryimages/diseasecurebomb.tex"),
}

PrefabFiles = {
    "royal_sunkenchest",
}

--TODO: Stop replacing messagebottletreasures and use a postinit on messagebottletreasuremanager instead.
local wilson_attack = 34

--mods
local unlockablechest = GLOBAL.KnownModIndex:IsModEnabled("workshop-2400387360")
local faf = GLOBAL.KnownModIndex:IsModEnabled("workshop-1908933602")
local um = GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790")

local treasures = GLOBAL.require("messagebottletreasures")

if GetModConfigData("config_tridentBuff") == 1 then
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
elseif GetModConfigData("config_tridentBuff") == 2 then
    AddRecipe(
        "trident",
        {Ingredient("boneshard", 3), Ingredient("kelp", 4), Ingredient("twigs", 2)},
        GLOBAL.RECIPETABS.WAR,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        false
    )
    GLOBAL.TUNING.TRIDENT.DAMAGE = wilson_attack * 3.0
    GLOBAL.TUNING.TRIDENT.USES = GLOBAL.TUNING.TRIDENT.USES + 50
    GLOBAL.TUNING.TRIDENT.SPELL.USE_COUNT = GLOBAL.TUNING.TRIDENT.USES
end

if GetModConfigData("config_sweeterFish") == 1 then
    AddIngredientValues({"oceanfish_medium_9_inv"}, {meat = 0.5, sweetener = 1, honey = 1}, true, true)

    AddPrefabPostInit(
        "oceanfish_medium_9_inv",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("honey", 1.0, "fishmeat_small", 1.0)
            end
        end
    )
end

if GetModConfigData("config_easierSeaweed") == 1 then
    modimport("postinit/waterplant_bomb") --Thanks, scrimbles.
    GLOBAL.TUNING.WATERPLANT.DAMAGE = GLOBAL.TUNING.WATERPLANT.DAMAGE * 0.75
    GLOBAL.TUNING.WATERPLANT.ITEM_DAMAGE = GLOBAL.TUNING.WATERPLANT.ITEM_DAMAGE * 1.75
end

if GetModConfigData("config_easierRockjaws") == 1 then
    GLOBAL.TUNING.SHARK.DAMAGE = 50 / 3
end

if GetModConfigData("config_hermitRecipes") == 1 then
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
        "normal_chum",
        {Ingredient("spoiled_food", 2),
        Ingredient("rope", 1)},
        --{Ingredient("waterplant_petal", 1)},
        GLOBAL.RECIPETABS.FISHING,
        GLOBAL.TECH.FISHING_ONE,
        nil,
        nil,
        true,
        1,
        nil,
        nil,
        nil,
        nil,
        "chum"
    )
    AddRecipe("hermitshop_chum", {Ingredient("messagebottleempty", 1)}, GLOBAL.RECIPETABS.HERMITCRABSHOP, GLOBAL.TECH.HERMITCRABSHOP_ONE,          nil, nil, true, 3, nil, nil, nil, nil, "chum")

    GLOBAL.STRINGS.RECIPE_DESC.WATERPLANT_PLANTER = "Grow your very own Sea Weed."
    GLOBAL.STRINGS.RECIPE_DESC.BLUEPRINT = "Learn new things."
    GLOBAL.STRINGS.RECIPE_DESC.PUMPKINCOOKIE = "Grandma's cookies."

    if um then
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
            "images/inventoryimages/diseasecurebomb.xml",
            "diseasecurebomb.tex",
            nil,
            "diseasecurebomb"
        )
    end
end
-- I *hate* how it doesn't fetch data from other mods, but I guess that's by design.

if GetModConfigData("config_livinglogGators") == 1 then
    AddPrefabPostInit(
        "grassgator",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("livinglog", 1, "livinglog", 1, "livinglog", 0.5)
            end
        end
    )
end

GLOBAL.TUNING.MESSAGEBOTTLE_NOTE_CHANCE = GetModConfigData("config_moreTreasure")

if GetModConfigData("config_foodRebalance") == 1 then
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

if GetModConfigData("config_moreShells") == 1 then
    AddPrefabPostInit(
        "cookiecutter",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("cookiecuttershell", 0.75)
            end
            if inst and inst.components.stackable ~= nil then
            inst.components.stackable.maxsize = GLOBAL.TUNING.STACK_SIZE_SMALLITEM
            end
        end
    )
end

if GetModConfigData("config_pearlRusher") == 1 then
    GLOBAL.CONSTRUCTION_PLANS["hermithouse_construction3"] = {
        Ingredient("moonrocknugget", 5),
        Ingredient("petals", 15),
        Ingredient("moonglass", 10)
    }
end

if GetModConfigData("config_betterMoonstorms") == 1 then
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

    AddRecipe(
        "alterguardianhatshard",
        {Ingredient("moonglass_charged", 1), Ingredient("moonstorm_spark", 2), Ingredient("lightbulb", 1)},
        GLOBAL.RECIPETABS.LIGHT,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        false
    )
    AddRecipe(
        "alterguardianhat",
        {Ingredient("alterguardianhatshard", 5), Ingredient("alterguardianhatshard_blueprint", 1)},
        nil,
        GLOBAL.TECH.LOST,
        nil,
        nil,
        true
    )

    GLOBAL.STRINGS.RECIPE_DESC.ALTERGUARDIANHATSHARD = "Harness the moonlight."
end

if GetModConfigData("config_moreKeys") == 1 then
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

if GetModConfigData("config_cheapBoats") == 1 then
    AddRecipe("anchor_item", 		   {Ingredient("boards", 1), 		Ingredient("rope", 2), Ingredient("cutstone", 2)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)
    AddRecipe("mast_item", 		   {Ingredient("boards", 1), 		Ingredient("rope", 2), Ingredient("silk", 6)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)
    AddRecipe("mast_malbatross_item", {Ingredient("driftwood_log", 2), Ingredient("rope", 3), Ingredient("malbatross_feathered_weave", 4)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.LOST)
    AddRecipe("steeringwheel_item",   {Ingredient("boards", 1), 		Ingredient("rope", 1)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)
    AddRecipe("fish_box",			   {Ingredient("cutstone", 1), 		Ingredient("rope", 2)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO, nil, 1.5, nil, nil, nil, nil, nil)
elseif GetModConfigData("config_cheapBoats") == 2 then
    AddRecipe("anchor_item", 		   {Ingredient("boards", 2), 		Ingredient("rope", 1), Ingredient("cutstone", 1)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)
    AddRecipe("mast_item", 		   {Ingredient("boards", 1), 		Ingredient("rope", 2), Ingredient("silk", 4)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)        
    AddRecipe("mast_malbatross_item", {Ingredient("driftwood_log", 1), Ingredient("rope", 2), Ingredient("malbatross_feathered_weave", 2)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.LOST)
    AddRecipe("steeringwheel_item",   {Ingredient("boards", 1), 		Ingredient("rope", 1)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO)
    AddRecipe("fish_box",			   {Ingredient("cutstone", 1), 		Ingredient("rope", 1)}, GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO, nil, 1.5, nil, nil, nil, nil, nil) 
    AddRecipe("waterpump",            {Ingredient("boards", 2),Ingredient("rope", 1)},               GLOBAL.RECIPETABS.SEAFARING, GLOBAL.TECH.SEAFARING_TWO, nil, 1.5, nil, nil, nil, nil, nil)
end

if GetModConfigData("config_logicalRepairs") == 1 then
    GLOBAL.TUNING.REPAIR_LOGS_HEALTH = 13 --25/4
    GLOBAL.TUNING.REPAIR_STICK_HEALTH = 6 --13
end

if GetModConfigData("config_turningBoats") == 1 then
    AddPrefabPostInit("boat", function(inst)
        if inst.components.boatphysics ~= nil then
            inst.components.boatphysics:SetCanSteeringRotate(true)
        end
    end)
end

if GetModConfigData("config_seasonalShoals") == 1 then
    AddPrefabPostInit("oceanfish_shoalspawner", function(inst)
        if GLOBAL.TheWorld ~= nil and inst.components.childspawner ~= nil then
            if GLOBAL.TheWorld.state.isautumn == true then
                inst.components.childspawner:SetRareChild("oceanfish_small_6", 0.2)
            elseif GLOBAL.TheWorld.state.iswinter == true then
                inst.components.childspawner:SetRareChild("oceanfish_medium_8", 0.2)
                inst.components.childspawner.childname = "oceanfish_medium_4"
            elseif GLOBAL.TheWorld.state.isspring == true then
                inst.components.childspawner:SetRareChild("oceanfish_small_7", 0.2)
                inst.components.childspawner.childname = "oceanfish_medium_5"
            elseif GLOBAL.TheWorld.state.issummer == true then
                inst.components.childspawner:SetRareChild("oceanfish_small_8", 0.2)
                inst.components.childspawner.childname = "oceanfish_medium_3"
            end
        end
    end)

    AddPrefabPostInit("oceanfish_medium_2", function(inst)
        local function OnSeasonChange(inst, season)
			if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_medium_4", function(inst)
        local function OnSeasonChange(inst, season)
			if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_small_6", function(inst)
        local function OnSeasonChange(inst, season)
			if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_medium_8", function(inst)
        local function OnSeasonChange(inst, season)
            if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_medium_5", function(inst)
        local function OnSeasonChange(inst, season)
            if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_small_7", function(inst)
        local function OnSeasonChange(inst, season)
            if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_medium_3", function(inst)
        local function OnSeasonChange(inst, season)
            if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)

    AddPrefabPostInit("oceanfish_small_8", function(inst)
        local function OnSeasonChange(inst, season)
            if inst.sg ~= nil then
			    inst.sg:GoToState("leave")
            else
                inst:Remove()
            end
        end
        inst:WatchWorldState("season", OnSeasonChange)
    end)
end

if GetModConfigData("config_hoarderCrabking") == 1 then
    --TODO: make chests not removethemselves on sinking and make them meaninful.
    AddPrefabPostInit("crabking", function(inst)
        inst:ListenForEvent("death", function(inst)
            local pos = inst:GetPosition()
            local messagebottletreasures = require("messagebottletreasures")
            local opalcount = 4 + inst.countgems(inst).opal
            for i = 1, opalcount do
                print(opalcount)
                messagebottletreasures.GenerateTreasure(pos, "royal_sunkenchest")
                --messagebottletreasures.GenerateTreasure(pos, "royal_sunkenchest").Transform:SetPosition(pos.x + math.random(-2, 2), pos.y, pos.z + math.random(-2, 2)) When I get the chests fixed.
            end
        end)
    end)
end

--[[if GetModConfigData("config_theukonBoats")
    AddPrefabPostInit("boat", function(inst)
        inst.components.boatphysics.damageable_velocity = 200
    end)
--end]]