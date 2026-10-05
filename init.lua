local mod = {}
mod.name = core.get_current_modname()
mod.modpath = core.get_modpath(mod.name)
mod.S = core.get_translator(mod.name)
mod.stack_max = 99
mod.settings = {
	artificial_turf = core.settings:get_bool("nicegrass.artificial_turf", true),
	no_dirt = core.settings:get_bool("nicegrass.no_dirt", true),
}
mod.sounds = {
	dirt = default.node_sound_dirt_defaults(),
	grass = default.node_sound_dirt_defaults({ footstep = { name = "default_grass_footstep", gain = 0.25 } }),
}

if core.get_modpath("xcompat") then
	mod.stack_max = xcompat.functions.get_default_stack_max() or 99
end

nicegrass = mod

local function load(file)
	dofile(mod.modpath .. "/" .. file)
end

-- Load files
if mod.settings.artificial_turf then
	load("artificial_turf.lua")
end
if mod.settings.no_dirt then
	load("no_dirt.lua")
end
