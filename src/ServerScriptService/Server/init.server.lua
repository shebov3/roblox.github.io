--[[ Services ]]
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local CollectionService = game:GetService("CollectionService")

--[[ Classes ]]
local Controller = require(ServerScriptService.Classes.Controller)
local Deck = require(ServerScriptService.Classes.Deck)
local Domino = require(ServerScriptService.Classes.Domino)

--[[ Modules ]]
local _Rooms = require(ServerScriptService.Modules.Rooms)

--[[ Variables ]]
for _, Room in pairs(CollectionService:GetTagged("Room")) do
	require(Room:FindFirstChildWhichIsA("ModuleScript"))
end

local function playerJoined(player)
	local playerController = Controller.new(player)
	playerController.Coins = 100
	playerController.InRoom = nil

	local folder = Instance.new("Folder")
	folder.Name = player.Name
	folder.Parent = workspace
	playerController.deck = Deck.new({ Domino.new(ServerStorage.Dominoes["00"], folder) })
		+ Domino.new(ServerStorage.Dominoes["01"], folder)
	print(playerController)
end

local function playerLeft(player)
	local _controller = require(player:FindFirstChild("Controller"))
end

game.Players.PlayerAdded:Connect(playerJoined)
game.Players.PlayerRemoving:Connect(playerLeft)
