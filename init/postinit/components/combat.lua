local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_crabkingRework") then
    env.AddComponentPostInit("combat", function(self)

        local _GetAttacked = self.GetAttacked

        function self:GetAttacked(attacker, damage, weapon, stimuli, ...)
            local weapon_check = weapon ~= nil and weapon:IsValid() and weapon or nil

            if (self.inst ~= nil and (self.inst.prefab == "crabking" or self.inst.prefab == "crabking_claw") and attacker ~= nil and (attacker.prefab == "cannonball_rock")) then
                damage = damage * (attacker.prefab == "cannonball_rock" and 4 or attacker.prefab == "cannonball_sludge" and 3)
                if self.inst.attack_count ~= nil then self.inst.attack_count = math.clamp(self.inst.attack_count - 1, 0, 10) end

                if self.inst.finishfixing ~= nil then self.inst.finishfixing(self.inst) end

                if self.inst.prefab == "crabking_claw" then
                    local crab = FindEntity(self.inst, 30, nil, {"crabking"})
                    if crab ~= nil and crab.finishfixing ~= nil then crab.finishfixing(crab) end
                end

                return _GetAttacked(self, attacker, damage, weapon_check, stimuli)
            else
                return _GetAttacked(self, atatcker, damage, weapon, stimuli, ...)
            end
        end
    end)
end
