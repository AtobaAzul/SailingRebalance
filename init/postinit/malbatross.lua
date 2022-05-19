if GetModConfigData("config_moreKeys") then
    if GLOBAL.KnownModIndex:IsModEnabled("workshop-2400387360") then
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
    end
end