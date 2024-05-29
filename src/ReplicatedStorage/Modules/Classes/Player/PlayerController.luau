local playerController = {}

function playerController:inherit(superClass)
	setmetatable(playerController, superClass)
end

return playerController
