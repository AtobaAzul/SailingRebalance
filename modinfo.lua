name = "[DEV] Sailing Rebalance"
version = "1.9.0"
description = [[
Version 1.9.0

This mod aims to tweak ocean content, making it more rewarding, without adding new content.
Main Features:

Trident Buff: Stats increased and costs 1 horn and 2 Bone shards.

New Sunken treasure presets: Scientist, Inventor and Farmer, and many more, with some tweaks to existing ones!

More treasure: The chance for treasure when reading a bottle is now 66% (Vanilla is 33%).

A bunch of other misc. tweaks and changes!

All features, except new treasure presets, can be configured.
]]

author = "Atobá Azul"
forumthread = ""
api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "sailingRebalance.xml"
icon = "sailingRebalance.tex"

server_filter_tags = {"boat","sea","ocean","sailingrebalance","rebalance","tweak"}
priority = -347

local function Header(title)
	return { name = "", label = title, hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function SkipSpace()
	return { name = "", label = "", hover = "", options = { {description = "", data = false}, }, default = false, }
end



	configuration_options = {
    Header("Items, Food & Recipes"),
    SkipSpace(),
        {
        name = "config_moreTreasure",
        label = "Higher treasure chance",
        options = {
                    {description = "33% (Default)", data = 0.66},
                    {description = "66%", data = 0.33},
                    {description = "100%", data = 0.00},
                  },
        default = 0.33,
        hover = "Choose how common treasures are.",
        },
        {
        name = "config_tridentBuff",
        label = "Trident Buff",
        options = {
                    {description = "Easier(3 Bones)", data = 2},
                    {description = "Default(1 Horn)", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Buff trident?",
      },

      {
        name = "config_hermitRecipes",
        label = "More Pearl trades",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Add more trades to Pearl's shop?",
      },

      {
        name = "config_pearlRusher",
        label = "Easier Pearl's Pearl",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Make it so the Tier 3 house doesn't cost cactus flowers.",
      },

      {
        name = "config_moreShells",
        label = "More Shells",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Increase drop chance of Cookie Cutter Shells.",
      },

      {
        name = "config_betterMoonstorms",
        label = "Better Moonstorms",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Makes the moonstorm event easier to repeat after the 1st.",
      },

      {
        name = "config_moreKeys",
        label = "More keys",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Requires unlockable sunken chest mod. Makes more things drop keys.",
      },

      {
        name = "config_cheapBoats",
        label = "Boat Cost",
        options = {
                    {description = "Default", data = 0},
                    {description = "Cheap",data = 1},
                    {description = "Cheapest",data = 2},

                  },
        default = 0,
        hover = "Choose how cheap you want boat parts to be.",
      },

      {
        name = "config_foodRebalance",
        label = "Food Rebalance",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Tweak some ocean foods?",
      },
      SkipSpace(),
      Header("Creatures"),
      SkipSpace(),
      {
        name = "config_sweeterFish",
        label = "Sweetish Fish Buff",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Buff Sweetish Fish?",
      },

      {
        name = "config_easierSeaweed",
        label = "Easier Seaweeds",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Make Seaweeds easier to fight?",
      },
      {
        name = "config_easierRockjaws",
        label = "Easier Rockjaws",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Make Rockjaws easier to fight?",
      },

      {
        name = "config_livinglogGators",
        label = "Grassgators drop Living Logs",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Make Grass Gators drop living logs?"
      },

      {
        name = "config_hoarderCrabking",
        label = "Crab King Treasure",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Make CK drop the treasures he hoarded?"
      },
      SkipSpace(),
      Header("Boats & Ocean"),
      SkipSpace(),
      {
        name = "config_logicalRepairs",
        label = "Logical Repair Values",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Tweaks the repair values of twigs, logs and boards to be a little bit more logical.",
      },

      {
        name = "config_turningBoats",
        label = "Boat Turning",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Enables the boat turning logic, which is off by default in vanilla.",
      },

      {
        name = "config_seasonalShoals",
        label = "Seasonal Shoals",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Shoals have different kinds of fish, depending on the season.",
      },
}


