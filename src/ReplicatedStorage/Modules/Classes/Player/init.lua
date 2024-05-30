local playerClass = {}
playerClass.__index = playerClass

function playerClass:createController(player)
	local controller = script.PlayerController:Clone()
	controller.Parent = player

	local playerController = require(controller)
	playerController:inherit(self)

	playerController.Money = 100
	playerController.Inventory = {}
	playerController.Skills = {}
end

function playerClass:AddMoney(Money)
	self.Money += Money
end

function playerClass:RemoveMoney(Money)
	self.Money -= Money
end

return playerClass
