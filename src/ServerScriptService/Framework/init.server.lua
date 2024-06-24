local classes = game.ReplicatedStorage.Modules.Classes
local playerClass = require(classes.Player)
local characterClass = require(classes.Character)

local function characterJoined(character)
	local controller = characterClass.createController(character)
	local characterController = require(controller)
	characterClass.init(characterController)
end

local function playerJoined(player)
	local controller = playerClass.createController(player)
	local playerController = require(controller)
	playerClass.init(playerController)
	playerController:AddMoney(50)

	print(playerController) -- Money: 150, Inventory = {}, Skills = {}
	player.CharacterAdded:Connect(characterJoined)
end

game.Players.PlayerAdded:Connect(playerJoined)
