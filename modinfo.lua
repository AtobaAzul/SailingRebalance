name = "Sailing Rebalance"
version = "1.12"
description = [[
Version 1.12

This mod aims to tweak ocean content, making it more rewarding, without adding new content.
Main Features:

Trident Buff: Stats increased and costs 1 horn and 2 Bone shards.

New Sunken treasure presets: Scientist, Inventor and Farmer, and many more, with some tweaks to existing ones!

Reworked Fish: Fish now drop meat based on their weight and some have extra drops!

A bunch of other misc. tweaks and changes!

All features can be configured.
]]

author = "Atobá Azul"
forumthread = ""
api_version = 10
dst_compatible = true
all_clients_require_mod = true

icon_atlas = "sailingRebalance.xml"
icon = "sailingRebalance.tex"

server_filter_tags = {"boat", "sea", "ocean", "sailingrebalance", "rebalance", "tweak"}
priority = -347

local function Header(title)
    return {name = "", label = title, hover = "", options = {{description = "", data = false}}, default = false}
end

local function SkipSpace()
    return {name = "", label = "", hover = "", options = {{description = "", data = false}}, default = false}
end

local function BinaryConfig(name, label, hover, default)
    return {
        name = name,
        label = label,
        hover = hover,
        options = {{description = "Enabled", data = true}, {description = "Disabled", data = false}},
        default = default
    }
end

configuration_options = {
    Header("Items, Food & Recipes"),
    SkipSpace(),
    {
        name = "config_tridentBuff",
        label = "Trident Buff",
        options = {
            {description = "Easier(3 Bones)", data = 2},
            {description = "Default(1 Horn)", data = 1},
            {description = "Disabled", data = 0}
        },
        default = 1,
        hover = "Buffs trident.\nTrident's stats generally have been improved and recipe made easier."
    },
    BinaryConfig("config_hermitRecipes", "More Pearl trades", "Adds more trades to Pearl's shop.", true),
    BinaryConfig("config_pearlRusher", "Easier Hermit House Upgrade", "Makes it so the Tier 3 house doesn't cost cactus flowers.", true),
    BinaryConfig("config_betterMoonstorms", "Better Moonstorms", "Makes the moonstorm event easier to repeat after the 1st.", true),
    BinaryConfig("config_moreKeys", "More keys", "Requires unlockable sunken chest mod.\nMakes more things drop keys.", true),
    BinaryConfig("config_foodRebalance", "Food Rebalance", "Tweaks some weaker ocean foods so they get a chance in the spotlight.\nCertain foods are further buffed if Feast & Famine is active.", true),
    BinaryConfig("config_thiccFish", "Better Ocean fish", "Changes ocean fishes to drop meat based on their weight.\nSome fish have extra loot.", true),
    SkipSpace(),
    Header("Creatures"),
    SkipSpace(),
    BinaryConfig("config_easierSeaweed", "Easier Seaweeds", "Makes Seaweeds easier to fight.\nThey no longer cause leaks and deal less damage.", true),
    BinaryConfig("config_easierRockjaws", "Easier Rockjaws", "Makes Rockjaws easier to fight.\nThey now deal 50 total damage.", true),
    BinaryConfig("config_livinglogGators", "Grassgators Buff", "Makes grass gators drop living logs.", true),
    BinaryConfig("config_hoarderCrabking", "Crab King Treasure", "Makes CK drop the treasures he once hoarded.", true),
    BinaryConfig("config_seasonalShoals", "Seasonal Shoals", "Shoals have different kinds of fish, depending on the season.", true),
    SkipSpace(),
    Header("Boats & Ocean"),
    SkipSpace(),
    BinaryConfig("config_turningBoats", "Steering Wheel Turning", "Steering Wheels will also rotate the boat if it has a rudder.", true),
    {
        name = "config_moreTreasure",
        label = "Higher treasure chance",
        options = {
            {description = "33% (Default)", data = 0.66},
            {description = "66%", data = 0.33},
            {description = "100%", data = 0.00}
        },
        default = 0.33,
        hover = "Choose how common treasures are."
    },
    {
        name = "config_customTreasure",
        label = "Custom Treasure Presets",
        options = {
            {description = "Often", data = 0.75},
            {description = "Default", data = 0.50},
            {description = "Rare", data = 0.33},
            {description = "Disabled", data = 0}
        },
        default = 0.50,
        hover = "Choose how common custom treasure presets are."
    },
    {
        name = "config_cheapBoats",
        label = "Boat Cost",
        options = {
            {description = "Default", data = 0},
            {description = "Cheap", data = 1},
            {description = "Cheapest", data = 2}
        },
        default = 1,
        hover = "Choose how cheap you want boat parts to be."
    },
    BinaryConfig("config_violentCannons", "Violent Cannons", "Less trajectory arch, much faster projectiles.", true),
    BinaryConfig("config_betterBumpers", "Better Bumpers", "Each craft for bumpers gives 8, for a full coverage. Bumpers have had their health doubled.", true),
    {
        name = "config_cannonFiremode",
        label = "Cannon Fire Mode",
        options = {
            {description = "Load & Shoot (Default)", data = "default"},
            {description = "Volley Fire", data = "volley", hover = "Cannons will cause nearby loaded cannons to also fire."},
            {description = "Automatic", data = "auto", hover = "Cannons immediatly fire after being loaded."},
        },
        default = "volley",
        hover = "Choose how cannons will fire."
    },
}
