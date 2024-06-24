local env = env
GLOBAL.setfenv(1, GLOBAL)

local _AddPlatformFollower = EntityScript.AddPlatformFollower
--local _RemovePlatformFollower = EntityScript.RemovePlatformFollower

function EntityScript:AddPlatformFollower(child)
    if child ~= nil then
        _AddPlatformFollower(self, child)
    end
    if child ~= nil and child:HasTag("structure") then --probably a bad assumption, but i'm assuming structures cant/wont leave the boat - yell at me if this messes anything. 
        RemovePhysicsColliders(child)                   --altough removing the structure collision instead of the player's seems like a more reasonable idea.
    end
end
