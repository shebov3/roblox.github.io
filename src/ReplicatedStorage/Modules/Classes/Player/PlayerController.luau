local playerController = {}

function playerController:init(superClass)
    setmetatable(playerController,superClass)
end

return playerController