if GetModConfigData("config_turningBoats") then
    AddPrefabPostInit("boat", function(inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end
        if inst.components.boatphysics ~= nil then
            inst.components.boatphysics:SetCanSteeringRotate(true)
        end
    end)
end