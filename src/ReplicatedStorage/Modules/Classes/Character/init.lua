local characterClass = {}
characterClass.__index = characterClass

function characterClass:createController(character)
	local controller = script.CharacterController:Clone()
	controller.Parent = character

	local CharacterController = require(controller)
	CharacterController:inherit(self)

	CharacterController.Block = false
end

return characterClass
