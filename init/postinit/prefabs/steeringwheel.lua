local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_turningBoats") then
    print("adding steering wheel postinit")
    env.AddPrefabPostInit("steeringwheel", function(inst)
        if not TheWorld.ismastersim then 
            return
        end

        local on_start_steering_old = inst.components.steeringwheel.onstartfn

        inst.components.steeringwheel.onstartfn = function(inst, sailor)
            local ret = on_start_steering_old(inst, sailor)
            local boat = inst:GetCurrentPlatform()
            if boat ~= nil then
                local x, y, z = boat.Transform:GetWorldPosition()
                local rudder = TheSim:FindEntities(x, y, z, TUNING.MAX_WALKABLE_PLATFORM_RADIUS, {"boatrotator"}, {"burnt", "INLIMBO", "_inventoryitem"})
                for k, v in ipairs(rudder) do
                    if k > 0 then
                        if boat.components.boatphysics ~= nil then
                            boat.components.boatphysics:SetCanSteeringRotate(true)
                            v:RemoveComponent("boatrotator") -- so you can't interact
                        end
                    end
                end
            end
            return ret
        end

        local on_stop_steering_old = inst.components.steeringwheel.onstopfn
        inst.components.steeringwheel.onstopfn = function(inst, sailor)
            local boat = inst:GetCurrentPlatform()
            local x, y, z = boat.Transform:GetWorldPosition()
            local ret = on_stop_steering_old(inst, sailor)
            local rudder = TheSim:FindEntities(x, y, z, TUNING.MAX_WALKABLE_PLATFORM_RADIUS, {"boatrotator"}, {"burnt", "INLIMBO", "_inventoryitem"})
            if boat ~= nil then
                boat.components.boatphysics:SetCanSteeringRotate(false)
                if rudder ~= nil then
                    for k, v in ipairs(rudder) do
                        v:AddComponent("boatrotator")
                    end
                end
            end
            return ret
        end
    end)

    env.AddPrefabPostInit("boat_rotator", function(inst)
        inst:AddTag("boatrotator") -- KLEI WHY
    end)
end
