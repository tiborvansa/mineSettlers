local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
--each variable into group numbers, should have one tile in  texture folder with same name...As
--variable "1" into group "numbers" will have "1.png" file for work. num_ counts from 1,next 2,3,4,5,6,7,8,9 to 0.
--each variable into numbers group (1,2,3,4,5,6,7,8,9,0) are "number" variable. (Down you can see that).
--numbers.lua,faces.lua,letters.lua and characters.lua makes the crafts of these nodes.
local numbers = {
	"1", "2", "3", "4", "5",
	"6", "7", "8", "9", "0",
}

local letters = {
	"A", "B", "C", "D", "E",
	"F", "G", "H", "I", "J",
	"K", "L", "M", "N", "O",
	"P", "Q", "R", "S", "T",
	"U", "V", "W", "X", "Y",
	"Z",
}

local characters = {
	"bracket1", "bracket2", "comma", "dash",
	"division", "equality", "exclamation", "line1",
	"multiplication", "plus", "procent", "question",
	"star", "stop", "line2", 
}

local faces = {
	"angry", "normal", "sad", "smile",
}
for _, number in pairs(numbers) do
	local nodenumber = number:lower():gsub(" ", "_")
	minetest.register_node("cube_nodes:number_"..nodenumber, {
		description = S("%s Cubenode"):format(S(number)),
		tiles = {"num_"..nodenumber..".png"},
		groups = {cracky=3},
	})
end
for _, letter in pairs(letters) do
	local nodeletter = letter:upper():gsub(" ", "_")
	minetest.register_node("cube_nodes:node_"..nodeletter, {
		description = S("%s Cubenode"):format(S(letter)),
		tiles = {"node_"..nodeletter..".png"},
		groups = {cracky=3},
	})
end
for _, character in pairs(characters) do
	local nodecharacter = character:lower():gsub(" ", "_")
	minetest.register_node("cube_nodes:char_"..nodecharacter, {
		description = S("%s Cubenode"):format(S(character)),
		tiles = {"char_"..nodecharacter..".png"},
		groups = {cracky=3},
	})
end
for _, face in pairs(faces) do
	local nodeface = face:lower():gsub(" ", "_")
	minetest.register_node("cube_nodes:face_"..nodeface, {
		description = S("%s Cubenode"):format(S(face)),
		tiles = {"face_"..nodeface..".png"},
		groups = {cracky=3},
	})
end

local modpath = minetest.get_modpath("cube_nodes")

-- Load files

dofile(modpath .. "/numbers.lua")
dofile(modpath .. "/faces.lua")
dofile(modpath .. "/letters.lua")
dofile(modpath .. "/characters.lua")
