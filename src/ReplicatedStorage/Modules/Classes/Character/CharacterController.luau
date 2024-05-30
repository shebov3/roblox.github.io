local characterController = {}

function characterController:inherit(superClass)
	setmetatable(characterController, superClass)
end

return characterController
