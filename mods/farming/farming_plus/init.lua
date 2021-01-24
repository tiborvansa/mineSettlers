farming_plus = {
  path = minetest.get_modpath("farming_plus")
}

-- Boilerplate to support localized strings if intllib mod is installed.
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	farming.S = intllib.Getter(minetest.get_current_modname())
else
	farming.S = function ( s ) return s end
end


farming.seeds = {
	["farming:pumpkin_seed"]=60,
	["farming_plus:strawberry_seed"]=30,
	["farming_plus:rhubarb_seed"]=30,
	["farming_plus:potatoe_seed"]=30,
	["farming_plus:tomato_seed"]=30,
	["farming_plus:orange_seed"]=30,
	["farming_plus:carrot_seed"]=30,
}


-- ========= GENERATE PLANTS IN THE MAP =========

dofile(farming_plus.path.."/good_ground.lua")
dofile(farming_plus.path.."/docgrass.lua")


for lvl = 1, 6, 1 do
	minetest.register_entity(":farming:potatoe_lvl"..lvl, {
		on_activate = function(self, staticdata)
			minetest.set_node(self.object:getpos(), {name="farming_plus:potatoe_1"})
		end
	})
end

minetest.register_abm({
	nodenames = {"farming:wheat"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="farming:wheat_8"})
	end,
})


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

-- helper function
local function ddoo(file, check)

  if check then
    dofile(farming_plus.path .. "/crops/" .. file)
  end
end


-- default settings
farming.strawberries_plus  = 0.002
farming.rhubarb_plus  = 0.002
farming.potatoes_plus  = 0.002
farming.tomatoes_plus  = 0.002
farming.oranges_plus  = 0.002
farming.bananas_plus  = 0.002
farming.carrots_plus  = 0.002
farming.cocoa_plus  = 0.002
farming.pumpkin_plus  = 0.002
farming.weed_plus  = 0.002
farming.cucumber_plus  = 0.002
farming.corn_plus  = 0.002
farming.melon_plus  = 0.002
farming.peaches_plus  = 0.002
farming.raspberries_plus  = 0.002
farming.lemons_plus  = 0.002
farming.walnut_plus  = 0.002

ddoo("strawberries.lua", farming.strawberries_plus)
ddoo("rhubarb.lua", farming.rhubarb_plus)
ddoo("potatoes.lua", farming.potatoes_plus)
ddoo("tomatoes.lua", farming.tomatoes_plus)
ddoo("oranges.lua", farming.oranges_plus)
ddoo("bananas.lua", farming.bananas_plus)
ddoo("carrots.lua", farming.carrots_plus)
ddoo("cocoa.lua", farming.cocoa_plus)
ddoo("pumpkin.lua", farming.pumpkin_plus)
ddoo("weed.lua", farming.weed_plus)
ddoo("cucumber.lua", farming.cucumber_plus)
ddoo("corn.lua", farming.corn_plus)
ddoo("melon.lua", farming.melon_plus)
ddoo("peaches.lua", farming.peaches_plus)
ddoo("raspberries.lua", farming.raspberries_plus)
ddoo("lemons.lua", farming.lemons_plus)
ddoo("walnut.lua", farming.walnut_plus)
ddoo("coffee.lua", farming.coffee_plus)






