local dominoHolder = {}

--[[ Metatable ]]
dominoHolder.__index = dominoHolder
dominoHolder.__add = dominoHolder.insert
dominoHolder.__sub = dominoHolder.remove

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)

--[[ Types ]]
type domino = dominoClass.domino
export type dominoHolder = { domino }

--[[ Constructor ]]
function dominoHolder.new(dominoes: dominoHolder): dominoHolder
	local self: dominoHolder = setmetatable({}, dominoHolder)
	self += dominoes
	return self
end

--[[ Public Functions ]]
function dominoHolder:remove(dominoes: dominoHolder)
	for i = 1, #dominoes do
		local domino = dominoes[i]
		local index = table.find(self, domino)
		table.remove(self, index)
	end
end

function dominoHolder:insert(dominoes: dominoHolder)
	print(#dominoes)
	for i = 1, #dominoes do
		local domino = dominoes[i]
		domino.Parent = workspace
		table.insert(self, i, domino)
	end
end

return dominoHolder
