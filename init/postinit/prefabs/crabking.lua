if GetModConfigData("config_hoarderCrabking") then
    local messagebottletreasures = require("messagebottletreasures_sr")
    AddPrefabPostInit("crabking", function(inst)
        inst:ListenForEvent("death", function(inst)
            local pos = inst:GetPosition()
            local red = inst.countgems(inst).red
            local blue = inst.countgems(inst).blue
            local purple = inst.countgems(inst).purple
            local yellow = inst.countgems(inst).yellow
            local orange = inst.countgems(inst).orange
            local green = inst.countgems(inst).green
            local opal = inst.countgems(inst).opal+1
            local pearl = inst.countgems(inst).pearl*3
    
            if red > 2 then
                red = 2
            end
            if blue > 2 then
                blue = 2
            end
            if purple > 2 then
                purple = 2
            end
            if yellow > 2 then
                yellow = 2
            end
            if orange > 2 then
                orange = 2
            end
            if green > 2 then
                green = 2
            end
            if opal > 2 then
                opal = 2
            end
    
            local royalcount = 3+(red + blue + purple + yellow + orange + green + pearl)*opal
            local normalcount = (1+(red + blue + purple + yellow + orange + green + pearl)*opal)/2
            local royalpos = royalcount*0.33
            local normalpos = normalcount*1.25
    
            if royalcount > 8 then
                royalcount = 8
            end

            if normalcount > 12 then
                normalcount = 12
            end

            for i = 1, royalcount do
                messagebottletreasures.GenerateTreasure(pos, "sunkenchest_royal").Transform:SetPosition(pos.x + math.random(-royalpos, royalpos), pos.y, pos.z + math.random(-royalpos, royalpos))
            end
            for i = 1, normalcount do
                messagebottletreasures.GenerateTreasure(pos, "sunkenchest").Transform:SetPosition(pos.x + math.random(-normalpos, normalpos), pos.y, pos.z + math.random(-normalpos, normalpos))
            end
        end)
    end)
end