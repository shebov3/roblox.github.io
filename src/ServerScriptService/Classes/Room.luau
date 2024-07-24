local Room = {}
Room.__index = Room

--[[ Modules ]]
local spawn = require(game.ReplicatedStorage.Packages.Spawn)
local warp = require(game.ReplicatedStorage.Packages.warp)

local dominoClass = require(script.Parent.Domino)
local boardClass = require(script.Parent.Board)
local boneyardClass = require(script.Parent.Boneyard)

--[[ Types ]]
type domino = dominoClass.domino
type board = boardClass.board
type boneyard = boneyardClass.boneyard
export type room = {
	board: board,
	host: Player,
	folder: Folder,
	boneyard: boneyard,
	queue: { Player },
	spectators: { Player },
	turn: number,
}

--[[ Private Functions ]]
local function CreateFolder(self)
	local folder = Instance.new("Folder")
	folder.Parent = workspace
	folder.Name = "Room_" .. self.host.Name
	return folder
end

local function init(self)
	local highestDouble = { value = -1 }
	local playerCount = #self.queue
	for i, player in pairs(self.queue) do
		local controller = require(player:FindFirstChild("Controller")):getSelf()
		for j = 1, 7 do
			local forceDoubleDraw = i == playerCount and j == 7 and highestDouble.value == -1
			local domino = forceDoubleDraw and self.boneyard:drawDouble() or self.boneyard:draw()
			controller.deck += domino
			if not domino:isDouble() and domino.value[1] <= highestDouble.value then
				continue
			end
			highestDouble.value = domino.value[1]
			highestDouble.domino = domino
			highestDouble.turn = i
		end
	end
	self.turn = highestDouble.turn
end

local function gameLoop(self)
	spawn(function()
		while true do
			local player = self.queue[self.turn]
			task.wait(10)
			self:nextTurn()
		end
	end)
end

local function start(self)
	init(self)
	gameLoop(self)
end

--[[ Constructor ]]
function Room.new(players: { Player }, host: Player)
	local self: room = setmetatable({}, Room)
	self.host = host
	self.queue = players
	self.spectators = {}
	local folder = CreateFolder(self)
	self.boneyard = boneyardClass.new(folder)
	self.board = boardClass.new(folder)
	start(self)
	return self
end

--[[ Public Functions ]]
function Room:nextTurn()
	self.turn += 1
	self.turn %= #self.queue + 1
end

function Room:specatate(player)
	table.insert(self.spectators, player)
end

return Room
