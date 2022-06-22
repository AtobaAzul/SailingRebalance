local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_turningBoats") then
    env.AddPrefabPostInit("steeringwheel", function(inst)
        local OldSetOnStartSteering = inst.components.steeringwheel.onstartfn
        inst.components.steeringwheel.onstartfn = function(inst, sailor)
            local ret = OldSetOnStartSteering(inst, sailor)
            local boat = inst:GetCurrentPlatform()
            if boat ~= nil then
                local x, y, z = boat.Transform:GetWorldPosition()
                local rudder = TheSim:FindEntities(x, y, z, TUNING.MAX_WALKABLE_PLATFORM_RADIUS, {"boatrotator"}, {"burnt", "INLIMBO", "_inventoryitem"})
                for k, v in ipairs(rudder) do
                    if k > 0 then
                        if boat.components.boatphysics ~= nil then
                            boat.components.boatphysics:SetCanSteeringRotate(true)
                            v:RemoveComponent("boatrotator")
                            --so you can't interact
                        end
                    end
                end
            end
            return ret
        end

        local OldSetOnStopSteering = inst.components.steeringwheel.onstopfn
        inst.components.steeringwheel.onstopfn = function(inst, sailor)
            inst:AddComponent("machine")
            print("onstop")
            local boat = inst:GetCurrentPlatform()
            local x, y, z = boat.Transform:GetWorldPosition()
            local ret = OldSetOnStopSteering(inst, sailor)
            local rudder = TheSim:FindEntities(x, y, z, TUNING.MAX_WALKABLE_PLATFORM_RADIUS, {"boatrotator"}, {"burnt"})
            if boat ~= nil then
                boat.components.boatphysics:SetCanSteeringRotate(false)
                print("removing steering rotate")
                if rudder ~= nil then
                    for k, v in ipairs(rudder) do
                        v:AddComponent("boatrotator")
                        print("re-added rotator component")
                    end
                end
            end
            return ret
        end
    end)
end