local playerClass = {}
playerClass.__index = playerClass

function playerClass.createController(player)
	local controller = script.PlayerController:Clone()
	controller.Parent = player
	return controller
end

function playerClass.init(controller)
	setmetatable(controller, playerClass)
	controller.Money = 100
	controller.Inventory = {}
	controller.Skills = {}
end

function playerClass:AddMoney(Money)
	self.Money += Money
end

function playerClass:RemoveMoney(Money)
	self.Money -= Money
end

return playerClass
