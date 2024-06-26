local classes = game.ReplicatedStorage.Modules.Classes
local playerClass = require(classes.Player)
local characterClass = require(classes.Character)

local function characterJoined(character)
	local controller: table = characterClass.new(character)
	print(controller)
end

local function playerJoined(player)
	player.CharacterAdded:Connect(characterJoined)
	local playerController: table = playerClass.new(player)

	--[[ Testing ]]
	task.wait(20)
	playerController.money = 50
	playerController.inventory = { 1, 2, "string", {} }
	print(playerController) -- money: 150, inventory = {}
end

game.Players.PlayerAdded:Connect(playerJoined)
