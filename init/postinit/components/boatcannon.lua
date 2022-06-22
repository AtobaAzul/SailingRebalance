
local env = env
GLOBAL.setfenv(1, GLOBAL)

if env.GetModConfigData("config_cannonFiremode") == "auto" then
    env.AddComponentPostInit("boatcannon", function(self)
        function self:LoadAmmo(ammo)
            --function hooking for some reason didn't work! help!
            if ammo == nil or not ammo:HasTag("boatcannon_ammo") or not ammo.projectileprefab then
                return false
            end

            self.loadedammo = ammo.projectileprefab
            self.inst:AddTag("ammoloaded")
            self.inst.sg:GoToState("load")
            self.inst:PushEvent("ammoloaded", self.loadedammo)
            return true
        end
    end)
end

env.AddComponentPostInit("boatcannon", function(self)
    function self:Shoot()
        if self.loadedammo == nil or self.loadedammo == nil then
            return
        end

        local x, y, z = self.inst.Transform:GetWorldPosition()
        local projectile = SpawnPrefab(self.loadedammo)
        if projectile == nil then
            self.loadedammo = nil
            return
        end

        local theta = self.inst.Transform:GetRotation() * DEGREES
        local radius = 0.5
        local offset = Vector3(radius * math.cos(theta), 0, -radius * math.sin(theta))

        projectile.Transform:SetPosition(x + offset.x, y + 0.6, z + offset.z)

        projectile.shooter = self.inst

        local angle = -self.inst.Transform:GetRotation() * DEGREES
        local distance = TUNING.BOAT.BOATCANNON.POWER --20
        local speed = TUNING.BOAT.BOATCANNON.POWER * TUNING.BOAT.BOATCANNON.SPEED --20

        -- Apply direction & power to shot
        local targetpos = Vector3(x + math.cos(angle) * distance, y, z + math.sin(angle) * distance)
        projectile.components.complexprojectile:SetHorizontalSpeed(speed)
        projectile.components.complexprojectile:SetGravity(-40 + TUNING.GRAVITY_OFFSET)
        projectile.components.complexprojectile:Launch(targetpos, self.inst, self.inst)

        -- Remove cannon ammo
        self.loadedammo = nil
        self.inst:RemoveTag("ammoloaded")

        -- Add a shot recoil to the boat
        local force_direction = -Vector3(math.cos(angle), 0, math.sin(angle))
        local force = 1
        local boat = self.inst:GetCurrentPlatform()
        if boat ~= nil then
            boat.components.boatphysics:ApplyForce(force_direction.x, force_direction.z, force)
        end

        if TUNING.CANNON_FIREMODE == "volley" or TUNING.CANNON_FIREMODE == "auto" then
            local cannons = TheSim:FindEntities(x, y, z, TUNING.WATERPLANT.ATTACK_AOE * 1.5, {"ammoloaded", "boatcannon"}, {"burnt"})
            for k, v in ipairs(cannons) do
                if v.components.boatcannon ~= nil then
                    v:DoTaskInTime(0, v.sg:GoToState("shoot"))
                end
            end
        end
    end
end)