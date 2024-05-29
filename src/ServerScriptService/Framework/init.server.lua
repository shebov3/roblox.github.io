local replicatedStorage = game:GetService("ReplicatedStorage")
local classes = replicatedStorage.Modules.classes
local playerClass = require(classes.player)

game.Players.PlayerAdded:Connect(function(player)
	playerClass.new(player)
end)
