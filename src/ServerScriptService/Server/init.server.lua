--[[ Services ]]
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--[[ Classes ]]
local Controller = require(ReplicatedStorage.Classes.Controller)
local Room = require(ServerScriptService.Classes.Room)
local Deck = require(ServerScriptService.Classes.Deck)
local Domino = require(ServerScriptService.Classes.Domino)

for _, LobbyRoom in pairs(CollectionService:GetTagged("Room")) do
	local roomController = require(LobbyRoom.RoomController)
	LobbyRoom.Main.Touched:Connect(function(part: BasePart)
		local Character = part.Parent
		local Player = Players:GetPlayerFromCharacter(Character)
		if not Player then return end
		local playerController = require(Player:FindFirstChild("Controller")):getSelf()
		if playerController.InRoom then return end
		playerController.InRoom = true
		roomController:AddPlayer(Player)
		local RootPart = Character.HumanoidRootPart
		RootPart.CFrame = LobbyRoom.Top.CFrame * CFrame.new(0, -10, 0)
	end)
end

local function playerJoined(player)
	local playerController = Controller.new(player):getSelf()
	playerController.Coins = 100
	playerController.InRoom = false
	local folder = Instance.new("Folder")
	folder.Name = player.Name
	folder.Parent = workspace
	playerController.deck = Deck.new({ Domino.new(ServerStorage.Dominoes["00"], folder) })
		+ Domino.new(ServerStorage.Dominoes["01"], folder)
	--controller.room = Room.new({ player }, player)
end

local function playerLeft(player)
	local playerController = require(player:FindFirstChild("Controller"))
end

game.Players.PlayerAdded:Connect(playerJoined)
game.Players.PlayerRemoving:Connect(playerLeft)
