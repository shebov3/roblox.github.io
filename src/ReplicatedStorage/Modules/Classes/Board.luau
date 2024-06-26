local boardClass = {}
boardClass.__index = boardClass

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)
local dominoHolderClass = require(script.Parent.DominoHolder)

--[[ Types ]]
type domino = dominoClass.domino
type dominoHolder = dominoHolderClass.dominoHolder
export type board = { dominoes: { domino } }

--[[ Constructor ]]
function boardClass.new(): board
	local self: board = setmetatable({}, boardClass)
	self.dominoes = dominoHolderClass.new()
	return self
end

return boardClass
