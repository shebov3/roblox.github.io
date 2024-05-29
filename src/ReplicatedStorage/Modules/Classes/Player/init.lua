local playerClass = {}
playerClass.__index = playerClass
playerClass.__tostring = function(self)
    return `Money: {self.Money}`
end

function playerClass.new(player: Player)
	local controller = script.PlayerController:Clone()
	controller.Parent = player

	local playerController = require(controller)
	playerController:init(playerClass)

	playerController.Money = 100
	playerController.Inventory = {}
	playerController.Skills = {}
end

function playerClass:AddMoney(Money)
	self.Money += Money
end

return playerClass
