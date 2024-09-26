--[[ Services ]]
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local CollectionService = game:GetService("CollectionService")

--[[ Classes ]]
local Controller = require(ServerScriptService.Classes.Controller)
local Deck = require(ServerScriptService.Classes.Deck)
local Domino = require(ServerScriptService.Classes.Domino)

local Rooms = CollectionService:GetTagged("Room")
for _, Room in pairs(Rooms) do
	require(Room:FindFirstChildWhichIsA("ModuleScript"))
end

local function playerJoined(player)
	local playerController = Controller.new(player)
	playerController.Coins = 100
	playerController.InRoom = false
	
	local folder = Instance.new("Folder")
	folder.Name = player.Name
	folder.Parent = workspace
	playerController.deck = Deck.new({ Domino.new(ServerStorage.Dominoes["00"], folder) })
		+ Domino.new(ServerStorage.Dominoes["01"], folder)
	print(playerController)
end

local function playerLeft(player)
	local controller = require(player:FindFirstChild("Controller"))
end

game.Players.PlayerAdded:Connect(playerJoined)
game.Players.PlayerRemoving:Connect(playerLeft)
