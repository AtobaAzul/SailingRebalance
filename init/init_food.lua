if GetModConfigData("config_foodRebalance") then
    local require = GLOBAL.require
    local cooking = require "cooking"
    local recipes = cooking.recipes.cookpot
    local warly_recipes = cooking.recipes.portablecookpot
    local faf = GLOBAL.KnownModIndex:IsModEnabled("workshop-1908933602")

    recipes.surfnturf.test = function(cooker, names, tags) return tags.meat and tags.meat >= 2.5 and tags.fish and tags.fish >= 2.0 and not tags.frozen end
    recipes.seafoodgumbo.test = function(cooker, names, tags) return tags.fish and tags.fish >= 3 and tags.meat >= 3 end
    recipes.seafoodgumbo.priority = 31
    recipes.barnaclesushi.test = function(cooker, names, tags) return (names.barnacle or names.barnacle_cooked) and (names.kelp or names.kelp_cooked) end        

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
                        inst.components.edible.healthvalue = 8
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
                    inst.components.edible.hungervalue = 100
                    inst.components.edible.sanityvalue = 5
                    inst.components.edible.healthvalue = 5
                end
            end
        )
    end
end