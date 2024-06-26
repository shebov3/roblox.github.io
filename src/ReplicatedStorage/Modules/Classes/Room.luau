local roomClass = {}
roomClass.__index = roomClass

--[[ Modules ]]
local dominoClass = require(script.Parent.Domino)
local boardClass = require(script.Parent.Board)

--[[ Types ]]
type domino = dominoClass.domino
export type room = { board: { domino }, queue: { Player }, spectators: { Player }}

function roomClass.new(players: { Player })
	local self: room = setmetatable({}, roomClass)
	self.board = boardClass.new()
	self.queue = players
	self.spectators = {}
	return self
end

function roomClass:specatate(player)
	table.insert(self.spectators, player)
end

return roomClass
