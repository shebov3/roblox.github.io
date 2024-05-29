local classes = game.ReplicatedStorage.Modules.Classes
local playerClass = require(classes.Player)

game.Players.PlayerAdded:Connect(function(player)
	playerClass:new(player)

	local playerController = require(player.PlayerController)
	playerController:AddMoney(50)

	print(tostring(playerController))
end)
