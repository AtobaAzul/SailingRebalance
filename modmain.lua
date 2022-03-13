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

GLOBAL.require("recipe")
TechTree = GLOBAL.require("techtree")
TECH = GLOBAL.TECH
Recipe = GLOBAL.Recipe
RECIPETABS = GLOBAL.RECIPETABS
Ingredient = GLOBAL.Ingredient
AllRecipes = GLOBAL.AllRecipes
TUNING = GLOBAL.TUNING
STRINGS = GLOBAL.STRINGS

local treasures = GLOBAL.require("messagebottletreasures")

if GetModConfigData("config_tridentBuff") == 1 then

    AllRecipes["trident"].ingredients = {Ingredient("boneshard", 2), Ingredient("gnarwail_horn", 1),Ingredient("twigs", 2)}

    TUNING.TRIDENT.DAMAGE = wilson_attack * 1.5
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES
elseif GetModConfigData("config_tridentBuff") == 2 then

    AllRecipes["trident"].ingredients = {Ingredient("boneshard", 3), Ingredient("kelp", 4),Ingredient("twigs", 2)}

    TUNING.TRIDENT.DAMAGE = wilson_attack * 3.0
    TUNING.TRIDENT.USES = TUNING.TRIDENT.USES + 50
    TUNING.TRIDENT.SPELL.USE_COUNT = TUNING.TRIDENT.USES
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
    TUNING.WATERPLANT.DAMAGE = TUNING.WATERPLANT.DAMAGE * 0.75
    TUNING.WATERPLANT.ITEM_DAMAGE = TUNING.WATERPLANT.ITEM_DAMAGE * 1.75
end

if GetModConfigData("config_easierRockjaws") == 1 then
    TUNING.SHARK.DAMAGE = 50 / 3
end

if GetModConfigData("config_hermitRecipes") == 1 then
    AddRecipe2(
        "hermit_boat",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_ONE,
        {nounlock = true, product = "boat_item", sg_state = "give"}
    )
    AddRecipe2(
        "hermit_mast",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_ONE,
        {nounlock = true, product = "mast_item", sg_state = "give"}
    )
    AddRecipe2(
        "hermit_anchor",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_ONE,
        {nounlock = true, product = "anchor_item", sg_state = "give"}
    )
    AddRecipe2(
        "hermit_steeringwheel",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_ONE,
        {nounlock = true, product = "steeringwheel_item", sg_state = "give"}

    )
    AddRecipe2(
        "hermit_patch",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_ONE,
        {nounlock = true, product = "boatpatch", sg_state = "give", numtogive = 4}
    )
    AddRecipe2(
        "hermit_blueprint",
        {Ingredient("messagebottleempty", 1)},
        GLOBAL.TECH.HERMITCRABSHOP_THREE,
        {nounlock = true, product = "blueprint", sg_state = "give"}
    )
    AddRecipe2(
        "hermit_waterplant",
        {Ingredient("messagebottleempty", 3)},
        TECH.HERMITCRABSHOP_FIVE,
        {nounlock = true, product = "waterplant_planter", sg_state = "give"}
    )

    AddRecipe2(
        "hermit_cookies",
        {Ingredient("messagebottleempty", 1)},
        TECH.HERMITCRABSHOP_SEVEN,
        {nounlock = true, product = "pumpkincookie", sg_state = "give"}
    )

    AddRecipe2(
        "normal_chum",
        {Ingredient("spoiled_food", 2),
        Ingredient("rope", 1)},
        TECH.FISHING_ONE,
        {product = "chum"}, {"FISHING"}
    )

    AllRecipes["hermitshop_chum"].ingredients = {Ingredient("messagebottleempty", 1)}
    AllRecipes["hermitshop_chum"].numtogive = 3

    STRINGS.RECIPE_DESC.WATERPLANT_PLANTER = "Grow your very own Sea Weed."
    STRINGS.RECIPE_DESC.BLUEPRINT = "Learn new things."
    STRINGS.RECIPE_DESC.PUMPKINCOOKIE = "Grandma's cookies."

    --[[if um then
        AddRecipe2(
            "hermit_umoil",
            {Ingredient("messagebottleempty", 3)},
            GLOBAL.TECH.HERMITCRABSHOP_FIVE,
            {nounlock = true, product = "diseasecurebomb", sg_state = "give", atlas = "images/inventoryimages/diseasecurebomb.xml", image = "diseasecurebomb.tex"},
            {"CRAFTING_STATION"}
        )
    end AAAAAAAAAAAAAAAAAA]]
end

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

TUNING.MESSAGEBOTTLE_NOTE_CHANCE = GetModConfigData("config_moreTreasure")

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

if GetModConfigData("config_pearlRusher") == 1 then
    GLOBAL.CONSTRUCTION_PLANS["hermithouse_construction3"] = {
        Ingredient("moonrocknugget", 5),
        Ingredient("petals", 15),
        Ingredient("moonglass", 10)
    }
end

if GetModConfigData("config_betterMoonstorms") == 1 then
    AddRecipe2(
        "moonstorm_static_item",
        {Ingredient("transistor", 1), Ingredient("moonstorm_spark", 2), Ingredient("goldnugget", 3)},
        TECH.LOST,
        nil,
        {"REFINE"}
    )

    AddPrefabPostInit(
        "alterguardian_phase3",
        function(inst)
            if inst and inst.components.lootdropper ~= nil then
                inst.components.lootdropper:AddChanceLoot("moonstorm_static_item_blueprint", 1)
            end
        end
    )

    STRINGS.RECIPE_DESC.MOONSTORM_STATIC_ITEM = "The power of the moon, contained!"

    AddRecipe2(
        "alterguardianhatshard",
        {Ingredient("moonglass_charged", 1), Ingredient("moonstorm_spark", 2), Ingredient("lightbulb", 1)},
        TECH.LOST,
        nil,
        {"LIGHT"}
    )
    AddDeconstructRecipe(
        "alterguardianhat",
        {Ingredient("alterguardianhatshard", 5), Ingredient("alterguardianhatshard_blueprint", 1)}
    )

    STRINGS.RECIPE_DESC.ALTERGUARDIANHATSHARD = "Harness the moonlight."
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
    AllRecipes["boat_item"].ingredients = {Ingredient("log", 12)}
    AllRecipes["anchor_item"].ingredients = {Ingredient("boards", 2), Ingredient("rope", 2),Ingredient("cutstone", 2)}
    AllRecipes["mast_item"].ingredients = {Ingredient("boards", 2), Ingredient("rope", 2),Ingredient("silk", 6)}
    AllRecipes["mast_malbatross_item"].ingredients = {Ingredient("driftwood_log", 2), Ingredient("rope", 3),Ingredient("malbatross_feathered_weave", 4)}
    AllRecipes["steeringwheel_item"].ingredients = {Ingredient("boards", 1), Ingredient("rope", 1)}
    AllRecipes["fish_box"].ingredients = {Ingredient("cutstone", 1), 		Ingredient("rope", 2)}
elseif GetModConfigData("config_cheapBoats") == 2 then
    AllRecipes["boat_item"].ingredients = {Ingredient("log", 8)}
    AllRecipes["anchor_item"].ingredients = {Ingredient("boards", 2), Ingredient("rope", 1),Ingredient("cutstone", 1)}
    AllRecipes["mast_item"].ingredients = {Ingredient("boards", 1), Ingredient("rope", 2),Ingredient("silk", 4)}
    AllRecipes["mast_malbatross_item"].ingredients = {Ingredient("driftwood_log", 1), Ingredient("rope", 2),Ingredient("malbatross_feathered_weave", 2)}
    AllRecipes["steeringwheel_item"].ingredients = {Ingredient("boards", 1), Ingredient("rope", 1)}
    AllRecipes["fish_box"].ingredients = {Ingredient("cutstone", 1), 		Ingredient("rope", 1)}
    AllRecipes["waterpump"].ingredients = {Ingredient("boards", 2), Ingredient("rope", 1)}
end

if GetModConfigData("config_turningBoats") == 1 then
    AddPrefabPostInit("boat", function(inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end
        if inst.components.boatphysics ~= nil then
            inst.components.boatphysics:SetCanSteeringRotate(true)
        end
    end)
end

if GetModConfigData("config_seasonalShoals") == 1 then
    AddPrefabPostInit("oceanfish_shoalspawner", function(inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end
        if inst.components.childspawner ~= nil then
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
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.isautumn then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_small_6", function(inst)
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.isautumn then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_medium_4", function(inst)
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.iswinter then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_medium_8", function(inst)
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.iswinter then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_medium_5", function(inst)
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.isspring then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_small_7", function(inst)
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.isspring then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
    end)

    AddPrefabPostInit("oceanfish_small_8", function(inst)
        if not GLOBAL.TheWorld.ismastersim then
			return
		end
        local function OnLoad(inst, data)
            if data ~= nil and data.herdprefab ~= nil then
                inst.components.herdmember.herdprefab = data.herdprefab
            end

            if data ~= nil and data.heavy then
                inst.heavy = data.heavy
            end

            if not GLOBAL.TheWorld.state.issummer then
                if inst.sg ~= nil then
                    inst.sg:GoToState("leave")
                else
                    inst:Remove()
                end
            end
        end
        inst.OnLoad = OnLoad
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

if GetModConfigData("config_thiccFish") == 1 then
--fish meat buff code by Electroely#0066, tysm!!
--1. remove existing drops (cook, perish, murder)
--2. add fns in place of those drops to give the meat according to a variable inst.meatvalue
--fish get +1 meat if above 75% weight, -1 if below 25%. can't go below 1
--gold value is determined by meatvalue. rare fish (baitfish & lionfish) give x3 gold for their value
local fishdata = { --{meatprefab, meatvalue, extraitems, israre }
	oceanfish_medium_1 = { "fishmeat", 2 }, --mudfish
	oceanfish_medium_2 = { "fishmeat", 2 }, --deep bass
	oceanfish_medium_3 = { "fishmeat", 3, nil, true }, --dandy lionfish
	oceanfish_medium_4 = { "fishmeat", 4 }, --black catfish
	oceanfish_medium_5 = { "corn",     2 }, --corn cod
	oceanfish_medium_6 = { "fishmeat", 2, nil, true }, --dappled koi
	oceanfish_medium_7 = { "fishmeat", 2, nil, true }, --golden koi
	oceanfish_medium_8 = { "fishmeat", 3, {"ice", "ice"} }, --ice bream
	
	oceanfish_small_1 = { "fishmeat_small", 1 }, --runty guppy
	oceanfish_small_2 = { "fishmeat_small", 1 }, --needlenosed squirt
	oceanfish_small_3 = { "fishmeat_small", 2, nil, true }, --bitty baitfish
	oceanfish_small_4 = { "fishmeat_small", 1 }, --smolt fry
	oceanfish_small_5 = { "corn_cooked",    1 }, --popperfish
	oceanfish_small_6 = { "plantmeat", 1 }, --fallounder
	oceanfish_small_7 = { "plantmeat", 1 }, --bloomfin tuna
	oceanfish_small_8 = { "fishmeat_small_cooked", 1 }, --scorching sunfish
	oceanfish_small_9 = { "fishmeat_small", 2, nil, true }, --spittlefish
}

local function OnWeightChanged(inst)
	local data = fishdata[inst.prefab] or fishdata[string.sub(inst.prefab, 0, -5)]
	local basevalue = data[2]
	local pct = inst.components.weighable:GetWeightPercent()
	if pct >= 0.75 then
		inst.meatvalue = basevalue + 1
	elseif pct < 0.25 then
		inst.meatvalue = basevalue - 1
	else
		inst.meatvalue = basevalue
	end
	inst.meatvalue = math.max(1, inst.meatvalue)
	local loot = {}
	for i = 1, inst.meatvalue do
		table.insert(loot, data[1])
	end
	if data[3] then
		for k, v in pairs(data[3]) do
			table.insert(loot, v)
		end
	end
	if inst.components.lootdropper ~= nil then
		inst.components.lootdropper:SetLoot(loot)
	end
	if inst.edit_fish_def then
		inst.fish_def.loot = loot
	end
	if inst.components.tradable ~= nil then
		inst.components.tradable.goldvalue = inst.meatvalue * (data[4] and 3 or 1)
	end
end
for prefab, data in pairs(fishdata) do
	AddPrefabPostInit(prefab, function(inst)
		if not GLOBAL.TheWorld.ismastersim then
			return
		end
		inst.edit_fish_def = true
		inst.fish_def = GLOBAL.deepcopy(inst.fish_def)
		inst:ListenForEvent("weightchanged", OnWeightChanged)
		inst:DoTaskInTime(0, OnWeightChanged)
	end)
	AddPrefabPostInit(prefab.."_inv", function(inst)
		if not GLOBAL.TheWorld.ismastersim then
			return
		end
		inst.meatvalue = 1
		--weight fn (also overrides murder loot)
		inst:ListenForEvent("weightchanged", OnWeightChanged)
		inst:DoTaskInTime(0, OnWeightChanged)
		--cook override
		if inst.components.cookable then
			local meatname = data[1]
			if string.sub(meatname, -7) ~= "_cooked" then
				meatname = meatname.."_cooked"
			end
			inst.components.cookable.product = meatname
			inst.components.cookable.oncooked = function(inst, cooker, chef)
				local cook_pos = (cooker and cooker:GetPosition()) or nil
				local x, y, z = inst.Transform:GetWorldPosition()
				local loot = {}
				for i = 1, inst.meatvalue-1 do
					table.insert(loot, SpawnPrefab(meatname))
				end
				if data[3] then
					for k, v in pairs(data[3]) do
						table.insert(loot, SpawnPrefab(v))
					end
				end
				for k, v in pairs(loot) do
					if chef.components.inventory then
						chef.components.inventory:GiveItem(v, nil, cook_pos)
					else
						v.components.inventoryitem:DoDropPhysics(x, y, z, true, 0.3)
					end
				end
				return true
			end
		end
		--perish override
		if inst.components.perishable then
			inst.components.perishable.onperishreplacement = nil
			inst.components.perishable:SetOnPerishFn(function(inst)
				local x, y, z = inst.Transform:GetWorldPosition()
				local owner = inst.components.inventoryitem.owner
				local holder = owner ~= nil and (owner.components.inventory or owner.components.container)
				local loot = {}
				for i = 1, inst.meatvalue do
					table.insert(loot, SpawnPrefab(data[1]))
				end
				if data[3] then
					for k, v in pairs(data[3]) do
						table.insert(loot, SpawnPrefab(v))
					end
				end
				local slot = holder and holder:GetItemSlot(inst)
				inst:Remove()
				for k, v in pairs(loot) do
					if holder then
						holder:GiveItem(v, slot)
					else
						v.components.inventoryitem:DoDropPhysics(x, y, z, true, 0.3)
					end
				end
				
			end)
		end
	end)
end

AddComponentPostInit("weighable", function(self)
	local SetWeight_old = self.SetWeight
	self.SetWeight = function(self, weight, ...)
		local rtn = {SetWeight_old(self, weight, ...)}
		self.inst:PushEvent("weightchanged", weight)
		return GLOBAL.unpack(rtn)
	end
end)

end
