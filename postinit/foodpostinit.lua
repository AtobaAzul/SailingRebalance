local require = GLOBAL.require
local cooking = require "cooking"
local recipes = cooking.recipes.cookpot
local warly_recipes = cooking.recipes.portablecookpot

recipes.surfnturf.test = function(cooker, names, tags) return tags.meat and tags.meat >= 2.5 and tags.fish and tags.fish >= 2.0 and not tags.frozen end
recipes.seafoodgumbo.test = function(cooker, names, tags) return tags.fish and tags.fish >= 3 and tags.meat >= 3 end
recipes.seafoodgumbo.priority = 31
recipes.barnaclesushi.test = function(cooker, names, tags) return (names.barnacle or names.barnacle_cooked) and (names.kelp or names.kelp_cooked) end        