local deck = {}

--[[ Metatable ]]
deck.__index = deck
deck.__add = function(lhs, rhs)
	return lhs:insert(rhs)
end
deck.__sub = function(lhs, rhs)
	return lhs:remove(rhs)
end

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)
local boardClass = require(script.Parent.Board)
local dominoHolderClass = require(script.Parent.DominoHolder)

--[[ Types ]]
export type deck = { dominoes: { domino } }
type domino = dominoClass.domino
type board = boardClass.board

--[[ Constructor ]]
function deck.new(dominoes: { domino }): deck
	local self: deck = setmetatable({}, deck)
	self.dominoes = dominoHolderClass.new(dominoes)
	return self
end

--[[ Public Functions ]]
function deck:play(domino: domino, board: board)
	self -= domino
	board += domino
end

function deck:playRandom(board: board)
	local domino = self.dominoes[self.dominoes.keys[math.random(1, #self.dominoes.keys)]]
	self:play(domino, board)
end

function deck:insert(dominoes: { domino } | domino)
	self.dominoes += dominoes
	return self
end

function deck:remove(dominoes: { domino } | domino)
	self.dominoes -= dominoes
	return self
end

return deck
