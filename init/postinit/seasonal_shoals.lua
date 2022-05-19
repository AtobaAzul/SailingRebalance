if GetModConfigData("config_seasonalShoals") then
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