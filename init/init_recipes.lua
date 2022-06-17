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



if GetModConfigData("config_hermitRecipes") then

    AddRecipe2("hermit_oceanfishinglure_spoon_red", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spoon_red", sg_state = "give"})
    AddRecipe2("hermit_oceanfishinglure_spoon_green", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spoon_green", sg_state = "give"})
    AddRecipe2("hermit_oceanfishinglure_spoon_blue", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spoon_blue", sg_state = "give"})
    AddRecipe2("hermit_oceanfishinglure_spinner_red", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spinner_red", sg_state = "give"})
    AddRecipe2("hermit_oceanfishinglure_spinner_green", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spinner_green", sg_state = "give"})
    AddRecipe2("hermit_oceanfishinglure_spinner_blue",	{Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, numtogive = 2, product = "oceanfishinglure_spinner_blue", sg_state = "give"})

    AddRecipe2("hermit_boat", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, product = "boat_item", sg_state = "give"})
    AddRecipe2("hermit_mast", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, product = "mast_item", sg_state = "give"})
    AddRecipe2("hermit_anchor", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, product = "anchor_item", sg_state = "give"})
    AddRecipe2("hermit_steeringwheel", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, product = "steeringwheel_item", sg_state = "give"})
    AddRecipe2("hermit_patch", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_ONE, {nounlock = true, product = "boatpatch", sg_state = "give", numtogive = 4})
    AddRecipe2("hermit_blueprint", {Ingredient("messagebottleempty", 1)}, GLOBAL.TECH.HERMITCRABSHOP_THREE, {nounlock = true, product = "blueprint", sg_state = "give"})
    AddRecipe2("hermit_waterplant", {Ingredient("messagebottleempty", 3)}, TECH.HERMITCRABSHOP_FIVE, {nounlock = true, product = "waterplant_planter", sg_state = "give"})
    AddRecipe2("hermit_cookies", {Ingredient("messagebottleempty", 1)}, TECH.HERMITCRABSHOP_SEVEN, {nounlock = true, product = "pumpkincookie", sg_state = "give"})

    AddRecipe2("normal_chum", {Ingredient("spoiled_food", 2), Ingredient("rope", 1)}, TECH.FISHING_ONE, {product = "chum"}, {"FISHING"})

    AllRecipes["hermitshop_chum"].ingredients = {Ingredient("messagebottleempty", 1)}
    AllRecipes["hermitshop_chum"].numtogive = 3

    --[[if GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790") then
        AddRecipe2(
            "hermit_oil",
            {Ingredient("messagebottleempty", 3)},
            GLOBAL.TECH.HERMITCRABSHOP_FIVE,
            {nounlock = true, product = "diseasecurebomb", sg_state = "give", atlas = "images/inventoryimages/diseasecurebomb.xml", image = "diseasecurebomb.tex"},
            {"CRAFTING_STATION"}
        )
    end AAAAAAAAAAAAAAAAAA]]
end

if GetModConfigData("config_pearlRusher") then
    GLOBAL.CONSTRUCTION_PLANS["hermithouse_construction3"] = {
        Ingredient("moonrocknugget", 5),
        Ingredient("petals", 15),
        Ingredient("moonglass", 10)
    }
end

if GetModConfigData("config_betterMoonstorms") then
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

end

if GetModConfigData("config_cheapBoats") == 1 then
    AllRecipes["boat_item"].ingredients = {Ingredient("boards", 3)}
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

if GetModConfigData("config_tridentBuff") == 1 then
    AllRecipes["trident"].ingredients = {Ingredient("boneshard", 2), Ingredient("gnarwail_horn", 1),Ingredient("twigs", 2)}
elseif GetModConfigData("config_tridentBuff") == 2 then
    AllRecipes["trident"].ingredients = {Ingredient("boneshard", 3), Ingredient("kelp", 4),Ingredient("twigs", 2)}
end

if GetModConfigData("config_cheaperCannonballs") then
    AllRecipes["cannonball_rock_item"].ingredients = {Ingredient("cutstone", 2), Ingredient("nitre", 1)}
end

STRINGS.RECIPE_DESC.WATERPLANT_PLANTER = "Grow your very own Sea Weed."
STRINGS.RECIPE_DESC.BLUEPRINT = "Learn new things."
STRINGS.RECIPE_DESC.PUMPKINCOOKIE = "Grandma's cookies."
STRINGS.RECIPE_DESC.MOONSTORM_STATIC_ITEM = "The power of the moon, contained!"
STRINGS.RECIPE_DESC.ALTERGUARDIANHATSHARD = "Harness the moonlight."