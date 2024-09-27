local Players = game:GetService("Players")
local Room = {}
Room.__index = Room

--[[ Modules ]]
local Spawn = require(game.ReplicatedStorage.Packages.Spawn)
local Warp = require(game.ReplicatedStorage.Packages.warp)

local dominoClass = require(script.Parent.Domino)
local Board = require(script.Parent.Board)
local Boneyard = require(script.Parent.Boneyard)

--[[ Types ]]
type domino = dominoClass.domino
type board = Board.board
type boneyard = Boneyard.boneyard

--[[ Private Functions ]]
local function CreateFolder(self)
	local folder = Instance.new("Folder")
	folder.Parent = workspace
	folder.Name = "Room_" .. self.Host.Name
	return folder
end

local function init(self)
	local highestDouble = { value = -1 }
	local playerCount = #self.Queue
	for i, Player in pairs(self.Queue) do
		local controller = require(Player.Controller)
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
	Spawn(function()
		while true do
			local player = self.Queue[self.turn]
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
function Room.new(host: Player, PlayersCapacity: number, FriendsOnly: boolean)
	local self = setmetatable({}, Room)
	self.Host = host
	self.PlayersCapacity = PlayersCapacity
	self.FriendsOnly = FriendsOnly
	self.Queue = {host}
	return self
end

function Room:Init()
	self.Spectators = {}
	local folder = CreateFolder(self)
	self.boneyard = Boneyard.new(folder)
	self.board = Board.new(folder)
	start(self)
end

function Room:Join(Player: Player)
	table.insert(self.Queue, Player.Name, Player)
end

function Room:Remove(Player: Player)
	table.remove(self.Queue, Player.Name)
end

--[[ Public Functions ]]
function Room:NextTurn()
	self.turn += 1
	self.turn %= #self.Queue + 1
end

function Room:specatate(player)
	table.insert(self.Spectators, player)
end

return Room
