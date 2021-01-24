--[[function biome_spawn.get_spawn_pos_abr(dtime,intrvl,radius,chance,reduction)
  local plyrs = minetest.get_connected_players()
  intrvl=1/intrvl

  if random()<dtime*(intrvl*#plyrs) then
    local plyr = plyrs[random(#plyrs)]    -- choose random player
    local vel = plyr:get_player_velocity()
    local spd = vector.length(vel)
    chance = (1-chance) * 1/(spd*0.75+1)
    
    local yaw
    if spd > 1 then
      -- spawn in the front arc
      yaw = minetest.dir_to_yaw(vel) + random()*0.35 - 0.75
    else
      -- random yaw
      yaw = random()*pi*2 - pi
    end
    local pos = plyr:get_pos()
    local dir = vector.multiply(minetest.yaw_to_dir(yaw),radius)
    local pos2 = vector.add(pos,dir)
    pos2.y=pos2.y-5
    local height, liquidflag = mobkit.get_terrain_height(pos2,32)
    if height then
      local objs = minetest.get_objects_inside_radius(pos,radius*1.1)
      for _,obj in ipairs(objs) do        -- count mobs in abrange
        if not obj:is_player() then
          local lua = obj:get_luaentity()
          if lua and lua.name ~= '__builtin:item' then
            chance=chance + (1-chance)*reduction  -- chance reduced for every mob in range
          end
        end
      end
      if chance < random() then
        pos2.y = height
        objs = minetest.get_objects_inside_radius(pos2,radius*0.95)
        for _,obj in ipairs(objs) do        -- do not spawn if another player around
          if obj:is_player() then return end
        end
        return pos2, liquidflag
      end
    end
  end
end
]]