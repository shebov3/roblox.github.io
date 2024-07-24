local dominoHolder = {}

--[[ Metatable ]]
dominoHolder.__index = dominoHolder
dominoHolder.__add = function(lhs, rhs)
	return lhs:insert(rhs)
end
dominoHolder.__sub = function(lhs, rhs)
	return lhs:remove(rhs)
end

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)

--[[ Types ]]
type domino = dominoClass.domino

--[[ Constructor ]]
function dominoHolder.new(dominoes: { domino } | domino): { domino }
	dominoes = dominoes or {}
	local self = setmetatable({}, dominoHolder)
	self.keys = {}
	self += dominoes
	return self
end

--[[ Public Functions ]]
function dominoHolder:remove(dominoes: { domino } | domino): { domino }
	if dominoes.model ~= nil then
		dominoes = table.pack(dominoes)
	end
	for _, domino in pairs(dominoes) do
		table.remove(self, domino.Name)
	end
	return self
end

function dominoHolder:insert(dominoes: { domino } | domino): { domino }
	if dominoes.model ~= nil then
		dominoes = table.pack(dominoes)
	end
	for _, domino in ipairs(dominoes) do
		table.insert(self.keys, domino.model.Name)
		self[domino.model.Name] = domino
	end
	return self
end

return dominoHolder
