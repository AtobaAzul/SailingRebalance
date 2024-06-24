local env = env
GLOBAL.setfenv(1, GLOBAL)

env.AddPrefabPostInit("boat_rotator", function(inst)
    inst:AddTag("boatrotator") -- They removed this during the beta, guh
end)

if env.GetModConfigData("config_adjustedSteering") then
    env.AddComponentPostInit("boatphysics", function(self)
        function self:GetBoatRotatorDrag()
            local x, y, z = self.inst.Transform:GetWorldPosition()
            local ents = TheSim:FindEntities(x, y, z, TUNING.BOAT.RADIUS)
            local has_rotator = false
            -- look for the rotator
            if ents and #ents > 0 then -- a little worried about this since it runs on update.
                for i, ent in ipairs(ents) do if ent:GetCurrentPlatform() and ent:GetCurrentPlatform() == self.inst then if ent:HasTag("boatrotator") then has_rotator = true end end end
            end

            if has_rotator then
                local vel_x, vel_z = VecUtil_NormalizeNoNaN(self.velocity_x, self.velocity_z)
                local tar_x, tar_z = VecUtil_NormalizeNoNaN(self.target_rudder_direction_x, self.target_rudder_direction_z)

                local diff_x, diff_z = VecUtil_Sub(vel_x, vel_z, tar_x, tar_z)

                local diff_mean = (math.abs(diff_x) + math.abs(diff_z))

                return (diff_mean + 1) * 2 -- +1 since it's a multiplier
            end

            return 1
        end

        local _GetBoatDrag = self.GetBoatDrag

        function self:GetBoatDrag(velocity, total_anchor_drag, ...) return _GetBoatDrag(self, velocity, total_anchor_drag, ...) * self:GetBoatRotatorDrag() end

        function self:GetRudderTurnSpeed()
            local velocity_length = VecUtil_Length(self.velocity_x, self.velocity_z)
            local x, y, z = self.inst.Transform:GetWorldPosition()
            local ents = TheSim:FindEntities(x, y, z, TUNING.BOAT.RADIUS) -- tiny extra range for stuff in the edges.
            local speed = 0.6 * 2

            local rudder_mult, piratehat_mult, steeringwheel_mult = 1, 1, 1

            -- look for the pirate hat
            if ents and #ents > 0 then -- a little worried about this since it runs on update.
                for i, ent in ipairs(ents) do
                    if ent:GetCurrentPlatform() and ent:GetCurrentPlatform() == self.inst then
                        if ent:HasTag("boat_health_buffer") then piratehat_mult = 1.25 end
                        if ent:HasTag("boatrotator") then rudder_mult = 1.125 end
                        if ent:HasTag("steeringwheel_copper") then steeringwheel_mult = 1.25 end
                    end
                end
            end

            local mults = rudder_mult * piratehat_mult * steeringwheel_mult

            if velocity_length > 7 then
                speed = 0.48 * 1.25 * mults
            elseif velocity_length > 5 then
                speed = 0.37 * 1.25 * mults
            elseif velocity_length > 3 then
                speed = 0.255 * 1.25 * mults
            elseif velocity_length > 1.5 then
                speed = 0.1975 * 1.25 * mults
            end

            return speed
        end
    end)
end
