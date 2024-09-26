local Boneyard = {}
Boneyard.__index = Boneyard
Boneyard.__add = function(lhs, rhs)
	return lhs.dominoes:insert(rhs)
end
Boneyard.__sub = function(lhs, rhs)
	return lhs.dominoes:remove(rhs)
end


--[[ Modules ]]
local DominoHolder = require(script.Parent.DominoHolder)
local Domino = require(script.Parent.Domino)

--[[ Types ]]
type domino = Domino.domino
export type boneyard = { dominoes: { domino } }

--[[ Constructor ]]
function Boneyard.new(folder): boneyard
	local self: boneyard = setmetatable({}, Boneyard)
	local dominoes = {}
	self.doubleKeys = {}
	for _, domino in pairs(game.ServerStorage.Dominoes:GetChildren()) do
		domino = Domino.new(domino, folder)
		if domino:isDouble() then
			table.insert(self.doubleKeys, domino.Name)
		end
		table.insert(dominoes, domino)
	end
	self.dominoes = DominoHolder.new(dominoes)
	return self
end

function Boneyard:drawDouble()
	local randNum = math.random(1, #self.doubleKeys)
	local doubleDomino: domino = self.dominoes[self.doubleKeys[randNum]]
	table.remove(self.dominoes, self.dominoes[self.doubleKeys[randNum]])
	table.remove(self.dominoes.keys, self.doubleKeys[randNum])
	return doubleDomino
end

function Boneyard:draw(): domino
	local randNum = math.random(1, #self.dominoes.keys)
	local domino: domino = self.dominoes[self.dominoes.keys[randNum]]
	table.remove(self.dominoes, self.dominoes.keys[randNum])
	table.remove(self.dominoes.keys, randNum)
	return domino
end

return Boneyard
