
local messagebottletreasures = require("messagebottletreasures_sr")

local function SpawnChest(inst)
    local pos = inst:GetPosition()
    messagebottletreasures.GenerateTreasure(pos, "sunkenchest").Transform:SetPosition(pos.x, pos.y, pos.z)
    inst:Remove()
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("CLASSIFIED")

    inst:DoTaskInTime(0, SpawnChest)

    return inst
end

return Prefab("sunkenchest_spawner", fn)
