local env = env
GLOBAL.setfenv(1, GLOBAL)

local bumpers = {
    "boat_bumber_shell",
    "boat_bumber_kelp"
}

for k, v in ipairs(bumpers) do
    env.AddPrefabPostInit(v, function(inst)
        inst:AddTag("notarget")
    end)
end
