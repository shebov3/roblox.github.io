local boardClass = {}
boardClass.__index = boardClass
boardClass.__add = function(lhs, rhs)
	return lhs.dominoes:insert(rhs)
end

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)
local dominoHolderClass = require(script.Parent.DominoHolder)

--[[ Types ]]
type domino = dominoClass.domino
export type board = { dominoes: { domino }, left: number, right: number }

--[[ Private Functions ]]
local function createFolder(parent)
	local folder = Instance.new("Folder")
	folder.Name = "Board"
	folder.Parent = parent
end

--[[ Constructor ]]
function boardClass.new(parent: Folder): board
	local self: board = setmetatable({}, boardClass)
	self.dominoes = dominoHolderClass.new()
	createFolder(parent)
	return self
end

return boardClass
