--
-- Register farming plants from csv0
-- 

local S = farming.intllib

local function read_csv(separator, path)
  local file = io.open(path, "r")
  local t = {}
  for line in file:lines() do
    if line:sub(1,1) ~= "#" and line:find("[^%"..separator.."% ]") then
      table.insert(t, line:split(separator, true))
    end
  end
  return t
end



local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end 

for i, pldef in ipairs(read_csv("|", farming.path .. "/crops.csv")) do

	local plname, mname, steps, descript, paramtype2, place_param2, minlight, maxlight, burntime, groups = unpack(pldef)

	-- Parse node names: transform empty strings into nil and separate node and count
	
	local new_node_def = {}
	local new_node_type = 1

	new_node_def.tiles = {}
	new_node_def.groups = {}
	new_node_def.sounds = {}

	if descript ~= "" then
		new_node_def.description = S(""..descript.."")
	end

  if steps ~= "" then
    new_node_def.steps = tonumber(steps)
  end

	if paramtype2 ~= "" then
		new_node_def.paramtype2 = paramtype2
	end

	if place_param2 ~= "" then
		new_node_def.place_param2 = tonumber(place_param2)
	end

	if minlight ~= "" then
		new_node_def.light_source = tonumber(minlight)
	end
	
	if maxlight ~= "" then
    new_node_def.light_source = tonumber(maxlight)
  end

	if burntime ~= "" then
    new_node_def.light_source = tonumber(burntime)
  end

  farming.register_plant(mname..":"..plname,new_node_def)

end







