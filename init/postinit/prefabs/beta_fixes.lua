local a = {
    "boat_bumber_shell",
    "boat_bumber_kelp"
}

for k, v in ipairs(a) do
    AddPrefabPostInit(v, function(inst)
        inst:AddTag("companion")
    end)
end