GLOBAL.require("map/terrain")

local ocean_deep =
{
    "OceanSwell",
    "OceanRough",
    "OceanHazardous"
}

for k, v in ipairs(ocean_deep) do
    AddRoomPreInit(v, function(room)
        if room.contents.distributeprefabs == nil then
            room.contents.distributeprefabs = {}
        end
        room.contents.distributeprefabs.oceanfishableflotsam_water = 0.133
        room.contents.distributeprefabs.sunkenchest_spawner = 0.02
    end)
end