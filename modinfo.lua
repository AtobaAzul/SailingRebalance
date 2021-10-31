name = "Sailing Rebalance"
version = "1.7.21" 
description = [[
This mod aims to tweak ocean content, making it more rewarding, without adding new content.

All features, except new treasure presets, can be configured.
]]

author = "Atobá Azul"
forumthread = ""
api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "boat.xml"
icon = "boat.tex" --need something original.

server_filter_tags = {"boat","sea","ocean","sailingrebalance","rebalance","tweak"}
priority = -347
               
	configuration_options = {
       {
        name = "config_tridentBuff",
        label = "Trident Buff",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Buff trident?",    
      },
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
        name = "config_foodRebalance",
        label = "Food Rebalance",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Tweak some ocean foods?",    
      },
 --[[           {
        name = "config_unlockchestKeys",
        label = "More treasure keys",
        options = {
                    {description = "Enabled", data = 1},
                    {description = "Disabled",data = 0},
                  },
        default = 1,
        hover = "Treasure Keys from Gnarlwails and sharks? [REQUIRES UNLOCKABLE SUNKEN CHESTS MOD]",    
      },]]
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
}



