--[[
	Farming Redo Mod
	by TenPlus1
	NEW growing routine by prestidigitator
	auto-refill by crabman77
]]

farming = {
	mod = "redo",
	version = "20200702",
	path = minetest.get_modpath("farming"),
	select = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	registered_plants = {}
}


local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function farming.is_creative(name)
	return creative_mode_cache or minetest.check_player_privs(name, {creative = true})
end


-- Intllib
local S = minetest.get_translator and minetest.get_translator("farming") or
		dofile(farming.path .. "/intllib.lua")
farming.intllib = S

-- helper function
local function ddoo(file, check)

  if check then
    dofile(farming.path .. "/crops/" .. file)
  end
end


-- API
dofile(farming.path.."/api.lua")
-- read catalog of crops
dofile(farming.path.."/csv_catalog.lua")


-- important items
dofile(farming.path.."/soil.lua")
dofile(farming.path.."/hoes.lua")
dofile(farming.path.."/grass.lua")
dofile(farming.path.."/utensils.lua")



-- default settings
farming.carrot = 0.001
farming.potato = 0.001
farming.tomato = 0.001
farming.cucumber = 0.001
farming.corn = 0.001
farming.coffee = 0.001
farming.melon = 0.001
farming.pumpkin = 0.001
farming.cocoa = true
farming.raspberry = 0.001
farming.blueberry = 0.001
farming.rhubarb = 0.001
farming.beans = 0.001
farming.grapes = 0.001
farming.barley = true
farming.chili = 0.003
farming.hemp = 0.003
farming.garlic = 0.001
farming.onion = 0.001
farming.pepper = 0.002
farming.pineapple = 0.001
farming.peas = 0.001
farming.beetroot = 0.001
farming.mint = 0.005
farming.cabbage = 0.001
farming.grains = true
farming.rarety = 0.002


-- Load new global settings if found inside mod folder
local input = io.open(farming.path.."/farming.conf", "r")
if input then
	dofile(farming.path .. "/farming.conf")
	input:close()
end

-- load new world-specific settings if found inside world folder
local worldpath = minetest.get_worldpath()
input = io.open(worldpath.."/farming.conf", "r")
if input then
	dofile(worldpath .. "/farming.conf")
	input:close()
end



-- default crops
dofile(farming.path.."/crops/wheat.lua")
dofile(farming.path.."/crops/cotton.lua")

-- add additional crops and food (if enabled)
ddoo("carrot.lua", farming.carrot)
ddoo("potato.lua", farming.potato)
ddoo("tomato.lua", farming.tomato)
ddoo("cucumber.lua", farming.cucumber)
ddoo("corn.lua", farming.corn)
ddoo("coffee.lua", farming.coffee)
ddoo("melon.lua", farming.melon)
ddoo("pumpkin.lua", farming.pumpkin)
ddoo("cocoa.lua", farming.cocoa)
ddoo("raspberry.lua", farming.raspberry)
ddoo("blueberry.lua", farming.blueberry)
ddoo("rhubarb.lua", farming.rhubarb)
ddoo("beans.lua", farming.beans)
ddoo("grapes.lua", farming.grapes)
--ddoo("barley.lua", farming.barley)
ddoo("hemp.lua", farming.hemp)
ddoo("garlic.lua", farming.garlic)
ddoo("onion.lua", farming.onion)
ddoo("pepper.lua", farming.pepper)
ddoo("pineapple.lua", farming.pineapple)
ddoo("peas.lua", farming.peas)
ddoo("beetroot.lua", farming.beetroot)
ddoo("chili.lua", farming.chili)
ddoo("ryeoatrice.lua", farming.grains)
ddoo("mint.lua", farming.mint)
ddoo("cabbage.lua", farming.cabbage)

dofile(farming.path .. "/food.lua")
dofile(farming.path .. "/mapgen.lua")
dofile(farming.path .. "/compatibility.lua") -- Farming Plus compatibility
dofile(farming.path .. "/lucky_block.lua")
