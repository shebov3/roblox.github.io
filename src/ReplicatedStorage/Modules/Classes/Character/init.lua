local characterClass = {}
characterClass.__index = characterClass

function characterClass.createController(character)
	local controller = script.CharacterController:Clone()
	controller.Parent = character
end

function characterClass.init(controller)
	setmetatable(controller, characterClass)
	controller.Block = false
	controller.Attack = false
	controller.Skills = {}
end

return characterClass
