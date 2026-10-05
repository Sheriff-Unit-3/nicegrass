local mod = nicegrass
local S = mod.S
local tiles = {
	"default_grass.png^[colorize:#00ff00:15",
	"default_dirt.png",
	{ name = "default_dirt.png^(default_grass_side.png^[colorize:#00ff00:15)", tileable_vertical = false },
}

if mod.settings.no_dirt then
	tiles = {
		"default_grass.png^[colorize:#00ff00:15",
		"default_dirt.png",
		{ name = "default_grass.png^[colorize:#00ff00:15", tileable_vertical = false },
	}
end

core.register_node(mod.name .. ":artificial_turf", {
	short_description = S("Artificial Turf"),
	description = S("Artificial Turf"),
	tiles = tiles,
	groups = { crumbly = 3 },
	sounds = mod.sounds.grass,
})

-- register a craft that outputs 6 artificial turf nodes
core.register_craft({
	output = mod.name .. ":artificial_turf 6",
	recipe = {
		{ "", "wool:green", "" },
		{ "default:dirt", "default:dirt", "default:dirt" },
		{ "default:dirt", "default:dirt", "default:dirt" },
	},
})
