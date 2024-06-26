local deck = {}
--[[ Metatable ]]
deck.__index = deck

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)
local boardClass = require(script.Parent.Board)
local dominoHolderClass = require(script.Parent.DominoHolder)

--[[ Types ]]
export type deck = { dominoes: dominoHolder }
type domino = dominoClass.domino
type board = boardClass.board
type dominoHolder = dominoHolderClass.dominoHolder

--[[ Constructor ]]
function deck.new(dominoes: { domino }): deck
	local self: deck = setmetatable({}, deck)
	deck.dominoes = dominoHolderClass.new(dominoes)
	return self
end

--[[ Public Functions ]]
function deck:play(domino: domino, board: board)
	self.dominoes:remove(domino)
	board.dominoes:insert(domino)
end

return deck
