if GetModConfigData("config_moreKeys") then
    if GLOBAL.KnownModIndex:IsModEnabled("workshop-2400387360") then
        AddPrefabPostInit(
            "shark",
            function(inst)
                if not GLOBAL.TheWorld.ismastersim then
                    return
                end
                inst.components.lootdropper:AddChanceLoot("sunkenchest_key", 0.25)
            end
        )
    end
end