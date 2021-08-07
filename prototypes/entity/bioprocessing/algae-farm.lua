-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.bioprocessing.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "algae-farm",
    base_entity = "assembling-machine-1",
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "bioprocessing",
    make_remnants = false,
}

local tier_map = {
    ["algae-farm"] = {tier = 1},
    ["algae-farm-2"] = {tier = 2},
    ["algae-farm-3"] = {tier = 3},
    ["algae-farm-4"] = {tier = 4},
}

-- Algae farm recipes revised in Angel's Bioprocessing 0.7.18, and again in 0.7.20 with addition of Algae farm 4
if reskins.lib.migration.is_version_or_newer(mods["angelsbioprocessing"], "0.7.18") and reskins.lib.migration.is_older_version(mods["angelsbioprocessing"], "0.7.20") then
    tier_map["algae-farm-3"].prog_tier = 4
end

-- Sea Block 0.5.5 revises algae farm 3 recipe for earlier access
if reskins.lib.migration.is_version_or_newer(mods["SeaBlock"], "0.5.5") then
    tier_map["algae-farm-3"].prog_tier = nil
end

-- Extended Angels has tier 5 ingredients prior to version 0.4.9
if reskins.lib.migration.is_version_or_older(mods["ExtendedAngels"], "0.4.8") then
    tier_map["algae-farm-4"].prog_tier = 5
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index[tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = "__angelsbioprocessing__/graphics/entity/algae-farm/algae-farm.png",
                priority = "extra-high",
                width = 288,
                height = 288,
                line_length = 6,
                frame_count = 36,
                shift = {0, 0},
                animation_speed = 0.4
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/bioprocessing/algae-farm/algae-farm-mask.png",
                priority = "extra-high",
                width = 288,
                height = 288,
                repeat_count = 36,
                shift = {0, 0},
                animation_speed = 0.4,
                tint = inputs.tint,
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/bioprocessing/algae-farm/algae-farm-highlights.png",
                priority = "extra-high",
                width = 288,
                height = 288,
                repeat_count = 36,
                shift = {0, 0},
                animation_speed = 0.4,
                blend_mode = reskins.lib.blend_mode,
            },
        }
    }

    -- Label to skip to next iteration
    ::continue::
end