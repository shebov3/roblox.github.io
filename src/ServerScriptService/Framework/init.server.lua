local classes = game.ReplicatedStorage.Modules.Classes
local playerClass = require(classes.Player)

local function characterJoined(character)
	playerClass:createController(character)
end

local function playerJoined(player)
	playerClass:createController(player)
	local playerController = require(player.PlayerController)
	playerController:AddMoney(50)

	print(playerController) -- Money: 150, Inventory = {}, Skills = {}
	player.CharacterAdded:Connect(characterJoined)
end

game.Players.PlayerAdded:Connect(playerJoined)
