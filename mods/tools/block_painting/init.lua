	
block_painting = {}

local modpath = minetest.get_modpath("block_painting")

dofile(modpath .. "/moreblocks.lua")

paintable = {
	{"default:wood", "block_painting:wood"},
	{"default:stone",  "block_painting:stone"},
	{"default:dirt_with_grass",  "block_paint:dirt_with_grass"},
	{"default:sand",  "block_painting:sand"},
	{"default:dirt",  "block_painting:dirt"},
	{"default:cobble",  "block_painting:cobble"},
	{"default:brick",  "block_painting:brick"},
	{"default:sandstone",  "block_painting:sandstone"},
	{"default:acacia_wood",  "block_painting:acacia_wood"},
	{"default:pine_wood",  "block_painting:pine_wood"},
	{"default:aspen_wood",  "block_painting:aspen_wood"},
	{"default:junglewood",  "block_painting:junglewood"},
	{"default:desert_sand",  "block_painting:desert_sand"},
	{"default:desert_sandstone",  "block_painting:desert_sandstone"},
	{"default:silver_sandstone",  "block_painting:silver_sandstone"},
	{"default:silver_sand",  "block_painting:silver_sand"},
	{"default:gravel",  "block_painting:gravel"},
	{"default:clay",  "block_painting:clay"},
	{"default:leaves",  "block_painting:leaves"},
	{"default:pine_needles",  "block_painting:pine_needles"},
	{"default:stonebrick",  "block_painting:stonebrick"},
	{"default:steelblock",  "block_painting:steelblock"},
	{"default:sandstonebrick",  "block_painting:sandstonebrick"},
	{"default:desert_sandstone",  "block_painting:desert_sandstone"},
	{"default:sandstone_block",  "block_painting:sandstone_block"},
	{"default:desert_sandstone_brick",  "block_painting:desert_sandstone_brick"},
	{"default:silver_sandstone_brick",  "block_painting:silver_sandstone_brick"},
	{"default:desert_sandstone_block",  "block_painting:desert_sandstone_block"},
	{"default:silver_sandstone_block",  "block_painting:silver_sandstone_block"},
	{"default:desert_stone",  "block_painting:desert_stone"},
	{"default:desert_cobble",  "block_painting:desert_cobble"},
	{"default:desert_stonebrick",  "block_painting:desert_stonebrick"},
	{"default:desert_stone_block",  "block_painting:desert_stone_block"},
	{"default:mossycobble",  "block_painting:mossycobble"},
	{"default:snow",  "block_painting:snow"},
	{"default:snowblock",  "block_painting:snowblock"},
	{"default:diamondblock",  "block_painting:diamondblock"},
	{"default:mese",  "block_painting:mese"},
	{"default:ice",  "block_painting:ice"},
	{"default:meselamp",  "block_painting:meselamp"},
	{"block_painting:base_block", "block_painting:base_block"},
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

local facedir_cb = {
  ["dye:white"] = 0,
  ["dye:green"] = 1,
  ["dye:red"] = 2,
  ["dye:blue"] = 3,
  ["dye:magenta"] = 4,
  ["dye:pink"] = 5,
  ["dye:yellow"] = 6,
  ["dye:orange"] = 7
}

 local wallmounted_cb = {
    ["dye:white"] = 0,
    ["unifieddyes:light_crimson "] = 1,
    ["dye:pink"] = 2,
    ["unifieddyes:light_rose"] = 2,
    ["dye:grey"] = 3,
    ["dye:dark_grey"] = 4,
    ["dye:black"] = 5,
    ["dye:brown"] = 6,
    ["unifieddyes:medium_red"] = 7,
    ["dye:red"] = 8,
    ["unifieddyes:vermilion"] = 9,
    ["dye:orange"] = 10,
    ["unifieddyes:amber"] = 11,
    ["dye:yellow"] = 12,
    ["unifieddyes:lime"] = 13,
    ["unifieddyes:chartreuse"] = 14,
    ["unifieddyes:harlequin"] = 15,
    ["dye:green"] = 16,
    ["unifieddyes:malachite"] = 17,
    ["unifieddyes:spring"] = 18,
    ["unifieddyes:turquoise"] = 19,
    ["dye:cyan"] = 20,
    ["unifieddyes:cerulean"] = 21,
    ["unifieddyes:azure"] = 22,
    ["unifieddyes:sapphire"] = 23,
    ["dye:blue"] = 24,
    ["unifieddyes:indigo"] = 25,
    ["dye:violet"] = 26,
    ["unifieddyes:mulberry"] = 27,
    ["dye:magenta"] = 28,
    ["unifieddyes:fuchsia"] = 29,
    ["unifieddyes:rose"] = 30,
    ["unifieddyes:crimson"] = 31,
  }

local default_dyes = {
  "black",
  "blue",
  "brown",
  "cyan",
  "dark_green",
  "dark_grey",
  "green",
  "grey",
  "magenta",
  "orange",
  "pink",
  "red",
  "violet",
  "white",
  "yellow"
}


local c_paramtype2 = {["color"]=1,["colorfacedir"]=8, ["colorwallmounted"]=32}
local wm_param2 = {["wallmounted"]=32,["colorwallmounted"]=32}
local supported_palette = {["block_painting_pallete_wallmounted.png"]=32,["block_painting_pallete_facedir.png"]=8}
function block_painting.generate_colored_nodes(name)
  --[[
  local i,j = string.find(name, ":")
  local modname = string.sub(name,i,j-1 ) 
  local nodename = string.sub(name,j+1,string.len(name))]]
  if minetest.registered_nodes[name] then do
  local def = table.copy(minetest.registered_nodes[name])     
    if def.paramtype2 == nil then 
      minetest.override_item(name, {
      paramtype2 = "color",
      palette = "block_painting_pallete_wallmounted.png",
      })  
    elseif def.paramtype2 == "facedir" then
      minetest.override_item(name, {
      paramtype2 = "colorfacedir",
      palette = "block_painting_pallete_facedir.png",      
      }) 
    elseif def.paramtype2 ==  "wallmounted"  then 
      minetest.override_item(name, {
      paramtype2 = "colorwallmounted",
      palette = "block_painting_pallete_wallmounted.png",
      })
    end  
  
    end
end
end

for _,valid_node in ipairs(paintable) do
  block_painting.generate_colored_nodes(valid_node[1])
end  


for _,default_node in pairs(block_painting.default_nodes) do
  for _,shape in pairs(block_painting.moreblock_shapes) do
    local node_name = "moreblocks:"..shape[1].."_"..default_node..shape[2]
    block_painting.generate_colored_nodes(node_name)
    end  
end 

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)

local painter = puncher and puncher:get_player_name() or ""
local wielded_item = puncher:get_wielded_item():get_name()
if wielded_item == "block_painting:paint_milk_tin" then
if not minetest.is_protected(pos, painter) then
    local old_node = minetest.get_node(pos)
    local def = table.copy(minetest.registered_nodes[node.name])
    local paramtype2 = def.paramtype2 or ""
    local old_param2 = old_node.param2 or 0
    local palette = def.palette or ""
    minetest.chat_send_all("name:"..node.name)
    minetest.chat_send_all("p2:"..old_param2)
    minetest.chat_send_all("pt2:"..paramtype2)
    minetest.chat_send_all("pal:"..palette)
    if c_paramtype2[def.paramtype2] then
      local paint = puncher:get_inventory():get_stack("main", puncher:get_wield_index()+1):get_name()      
      local colorbit = -1
      local color = -1  
        if  def.paramtype2 =="color" then  
            color = wallmounted_cb[paint]  or -1              
            colorbit = 8*color
        elseif def.paramtype2 == "colorwallmounted" then  
            color = wallmounted_cb[paint] or -1
            colorbit =  color*8 + math.fmod(old_param2,8)  
        elseif def.paramtype2 == "colorfacedir" then
             color = facedir_cb[paint] or -1
             colorbit = color*32 + math.fmod(old_param2,32)       
        else colorbit = -1 end                         
      if def.groups and def.groups.ud_param2_colorable then 
        end       
      if not supported_palette[palette] then   
         minetest.chat_send_all("Unknown_pallete")       
       end
      if color > -1 then 
        minetest.chat_send_all("color:"..color)
        minetest.chat_send_all("CB:"..colorbit)           
        node.param2 = colorbit                   
        minetest.set_node(pos,node)
        puncher:get_inventory():remove_item("main", paint)
      elseif color == -1 then 
          minetest.chat_send_all("You_can't_use_this_color_on_"..def.paramtype2.." node")
          end  
 end 
 end end end)





----items----

minetest.register_craftitem("block_painting:paint_milk_tin", {
		description = "".. core.colorize("#fff000", "Painting\n")..core.colorize("#FFFFFF", "Use it on a block, while having dye in your next inventory slot, to paint it\n")..core.colorize("#ff1200", "Does not work on all blocks..."),
	range = 5,
	stack_max = "1",
	inventory_image = "block_painting_tin.png",
})
--[[minetest.register_craftitem("block_painting:paint_stripper", {
		description = "".. core.colorize("#fff000", "Paint stripper\n")..core.colorize("#FFFFFF", "Use it along with a paintbrush, to remove paint from blocks"),
	inventory_image = "block_painting_paint_stripper.png",
	stack_max = "999",
})]]

---crafts---


minetest.register_craft({
	output = "block_painting:paint_milk_tin",
	recipe = {
		{"","group:food_milk","basic_materials:oil_extract"},
		{"","default:copper_ingot",""},
		{"","",""},
	}
})

minetest.register_craft({
  output = "block_painting:paint_oil_tin",
  recipe = {
    {"","basic_materials:oil_extract","basic_materials:oil_extract"},
    {"","default:copper_ingot",""},
    {"","",""},
  }
})


--[[minetest.register_craft({
	output = "block_painting:paint_stripper 30",
	recipe = {
	{"default:junglegrass","default:junglegrass","default:junglegrass"},
	{"farming:flour","default:steel_ingot","farming:flour"},
	}
})]]


