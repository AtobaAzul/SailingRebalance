local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_cannonFiremode") == "auto" then
    env.AddPrefabPostInit("boat_cannon", function(inst)
        --[[local function ongivenitem(inst, giver, item)
        --if inst.components.boatcannon == nil then
        --    return
        --end
            print("don't care RUN ALREADY")
        inst.components.boatcannon:LoadAmmo(item)
        print("ammo loaded! WHY ISNT THIS WORKING?!")
        inst:DoTaskInTime(0, inst.sg:GoToState("shoot"))
    end

    inst.components.trader.onaccept = ongivenitem]]
        inst:ListenForEvent("ammoloaded", function(inst)
            inst:DoTaskInTime(math.random(), inst.sg:GoToState("shoot"))
        end)
    end)
end