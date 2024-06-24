local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_noBoatPvP") then
    env.AddComponentPostInit("hullhealth", function(self)
        local _OnCollide = self.OnCollide

        function self:OnCollide(data)
            if data.other ~= nil and data.other:HasTag("boat") and not TheNet:GetPVPEnabled() then
                return
            else
                return _OnCollide(self, data)
            end
        end
    end)
end
