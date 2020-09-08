-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Compatibility with ShinyAngelGFX
if mods["ShinyAngelGFX"] then
    require("shiny-angel-compatibility")
end

----------------------------------------------------------------------------------------------------
-- ITEMS
----------------------------------------------------------------------------------------------------
require("prototypes.items.smelting.ores")

----------------------------------------------------------------------------------------------------
-- TECHNOLOGY
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- COMPATIBILITY
----------------------------------------------------------------------------------------------------
require("prototypes.compatibility.bobselectronics")

-- Assign deferred icons
reskins.lib.assign_deferred_icons("angels", "data-updates")