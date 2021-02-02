	
paintable = {
	{"default:wood", "default:wood"},
	{"default:stone", "default:stone"},
	{"default:dirt_with_grass", "default:dirt_with_grass"},
	{"default:sand", "default:sand"},
	{"default:dirt", "default:dirt"},
	{"default:cobble", "default:cobble"},
	{"default:brick", "default:brick"},
	{"default:sandstone", "default:sandstone"},
	{"default:acacia_wood", "default:acacia_wood"},
	{"default:pine_wood", "default:pine_wood"},
	{"default:aspen_wood", "default:aspen_wood"},
	{"default:junglewood", "default:junglewood"},
	{"default:desert_sand", "default:desert_sand"},
	{"default:desert_sandstone", "default:desert_sandstone"},
	{"default:silver_sandstone", "default:silver_sandstone"},
	{"default:silver_sand", "default:silver_sand"},
	{"default:gravel", "default:gravel"},
	{"default:clay", "default:clay"},
	{"default:leaves", "default:leaves"},
	{"default:pine_needles", "default:pine_needles"},
	{"default:stonebrick", "default:stonebrick"},
	{"default:steelblock", "default:steelblock"},
	{"default:sandstonebrick", "default:sandstonebrick"},
	{"default:desert_sandstone", "default:desert_sandstone"},
	{"default:sandstone_block", "default:sandstone_block"},
	{"default:desert_sandstone_brick", "default:desert_sandstone_brick"},
	{"default:silver_sandstone_brick", "default:silver_sandstone_brick"},
	{"default:desert_sandstone_block", "default:desert_sandstone_block"},
	{"default:silver_sandstone_block", "default:silver_sandstone_block"},
	{"default:desert_stone", "default:desert_stone"},
	{"default:desert_cobble", "default:desert_cobble"},
	{"default:desert_stonebrick", "default:desert_stonebrick"},
	{"default:desert_stone_block", "default:desert_stone_block"},
	{"default:mossycobble", "default:mossycobble"},
	{"default:snow", "default:snow"},
	{"default:snowblock", "default:snowblock"},
	{"default:diamondblock", "default:diamondblock"},
	{"default:mese", "default:mese"},
	{"default:ice", "default:ice"},
	{"default:meselamp", "default:meselamp"},
}

local colors = {
	["block_painting:paint_stripper"] = 0,
	["block_painting:green_paint"] = 1,
	["block_painting:red_paint"] = 2,
	["block_painting:blue_paint"] = 3,
	["block_painting:grey_paint"] = 4,
	["block_painting:black_paint"] = 5,
	["block_painting:yellow_paint"] = 6,
	["block_painting:orange_paint"] = 7,
	["block_painting:pink_paint"] = 8,
	["block_painting:cyan_paint"] = 9,
	["block_painting:magenta_paint"] = 10,
	["block_painting:violet_paint"] = 11,
	["block_painting:brown_paint"] = 12,
	["block_painting:salad_paint"] = 13,
	["block_painting:lightblue_paint"] = 14
}


minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
local painter = puncher and puncher:get_player_name() or ""
local wielded_item = puncher:get_wielded_item():get_name()
if wielded_item == "block_painting:paintbrush" then
if not minetest.is_protected(pos, painter) then
	for _,valid_node in ipairs(paintable) do
	if node.name == valid_node[1] 	 
then
local paint = 
puncher:get_inventory():get_stack("main", puncher:get_wield_index()+1):get_name() 
		local color = colors[paint] or false 
		if color ~= false then
	node.name = valid_node[2]
	node.param2 = color
	minetest.set_node(pos,node)
	puncher:get_inventory():remove_item("main", paint)
	end end end end end end)

----items----

minetest.register_craftitem("block_painting:paintbrush", {
		description = "".. core.colorize("#fff000", "Paintbrush\n")..core.colorize("#FFFFFF", "Use it on a block, while having paint in your next inventory slot, to paint it\n")..core.colorize("#ff1200", "Does not work on all blocks..."),
	range = 5,
	stack_max = "1",
	inventory_image = "block_painting_paintbrush.png",
})
minetest.register_craftitem("block_painting:paint_stripper", {
		description = "".. core.colorize("#fff000", "Paint stripper\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to remove paint from blocks"),
	inventory_image = "block_painting_paint_stripper.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:green_paint", {
		description = "".. core.colorize("#fff000", "Green paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_green_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:red_paint", {
		description = "".. core.colorize("#fff000", "Red paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_red_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:blue_paint", {
		description = "".. core.colorize("#fff000", "Blue paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_blue_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:grey_paint", {
		description = "".. core.colorize("#fff000", "Grey paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_grey_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:black_paint", {
		description = "".. core.colorize("#fff000", "Black paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_black_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:yellow_paint", {
		description = "".. core.colorize("#fff000", "Yellow paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_yellow_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:orange_paint", {
		description = "".. core.colorize("#fff000", "Orange paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_orange_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:pink_paint", {
		description = "".. core.colorize("#fff000", "Pink paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_pink_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:cyan_paint", {
		description = "".. core.colorize("#fff000", "Cyan paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_cyan_paint.png",
	stack_max = "999",
})

minetest.register_craftitem("block_painting:magenta_paint", {
		description = "".. core.colorize("#fff000", "Magenta paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_magenta_paint.png",
	stack_max = "999",
})
minetest.register_craftitem("block_painting:violet_paint", {
		description = "".. core.colorize("#fff000", "Violet paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_violet_paint.png",
	stack_max = "999",
})
minetest.register_craftitem("block_painting:brown_paint", {
		description = "".. core.colorize("#fff000", "Brown paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_brown_paint.png",
	stack_max = "999",
})
minetest.register_craftitem("block_painting:salad_paint", {
		description = "".. core.colorize("#fff000", "Salad paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_salad_paint.png",
	stack_max = "999",
})
minetest.register_craftitem("block_painting:lightblue_paint", {
		description = "".. core.colorize("#fff000", "Light blue paint\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to paint blocks"),
	inventory_image = "block_painting_lightblue_paint.png",
	stack_max = "999",
})

---crafts---

minetest.register_craft({
	output = "block_painting:paintbrush 1",
	recipe = {
		{"","farming:cotton","farming:cotton"},
		{"","default:steel_ingot","farming:cotton"},
		{"group:stick","",""},
	}
})

minetest.register_craft({
	output = "block_painting:paint_stripper 30",
	recipe = {
	{"default:junglegrass","default:junglegrass","default:junglegrass"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:green_paint 30",
	recipe = {
	{"dye:green","dye:green","dye:green"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:blue_paint 30",
	recipe = {
	{"dye:blue","dye:blue","dye:blue"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:red_paint 30",
	recipe = {
	{"dye:red","dye:red","dye:red"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:grey_paint 30",
	recipe = {
	{"dye:grey","dye:grey","dye:grey"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:black_paint 30",
	recipe = {
	{"dye:black","dye:black","dye:black"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:yellow_paint 30",
	recipe = {
	{"dye:yellow","dye:yellow","dye:yellow"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:orange_paint 30",
	recipe = {
	{"dye:orange","dye:orange","dye:orange"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:pink_paint 30",
	recipe = {
	{"dye:pink","dye:pink","dye:pink"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:cyan_paint 30",
	recipe = {
	{"dye:cyan","dye:cyan","dye:cyan"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:violet_paint 30",
	recipe = {
	{"dye:violet","dye:violet","dye:violet"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:magenta_paint 30",
	recipe = {
	{"dye:magenta","dye:magenta","dye:magenta"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:brown_paint 30",
	recipe = {
	{"dye:brown","dye:brown","dye:brown"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:lightblue_paint 30",
	recipe = {
	{"dye:blue","dye:white","dye:blue"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

minetest.register_craft({
	output = "block_painting:salad_paint 30",
	recipe = {
	{"dye:green","dye:yellow","dye:green"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})

-----painted nodes-----


minetest.override_item("default:wood", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:stone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:dirt_with_grass", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:sand", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:dirt", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:brick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:cobble", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:sandstone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:pine_wood", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:acacia_wood", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:junglewood", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:aspen_wood", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_sand", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_sandstone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:silver_sandstone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:silver_sand", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:gravel", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:clay", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:leaves", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:pine_needles", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:stonebrick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:steelblock", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:sandstonebrick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:sandstone_block", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_sandstone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_sandstone_brick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_sandstone_block", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:silver_sandstone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:silver_sandstone_brick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:silver_sandstone_block", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_stonebrick", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_stone_block", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_stone", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:desert_cobble", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:mossycobble", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:snow", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:snowblock", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:diamondblock", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:mese", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:ice", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})
minetest.override_item("default:meselamp", {
	paramtype2 = "color",
	palette = "block_painting_pallete.png",
})