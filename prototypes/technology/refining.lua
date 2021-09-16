-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.technologies) then return end

-- Setup standard inputs
local inputs = {
    mod = "angels",
    group = "refining",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
}

local technologies = {
    -- Advanced Ore Refinining (Ore Sorting Facility)
    ["advanced-ore-refining-1"] = {tier = 2, icon_name = "advanced-ore-refining"},
    ["advanced-ore-refining-2"] = {tier = 3, icon_name = "advanced-ore-refining"},
    ["advanced-ore-refining-3"] = {tier = 4, icon_name = "advanced-ore-refining"},
}

reskins.lib.create_icons_from_list(technologies, inputs)