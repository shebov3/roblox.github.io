local playerClass = {}
playerClass.__index = playerClass

function playerClass.new(player : Player)
    local PlayerController = script.PlayerController:Clone()
    PlayerController.Parent = player
    require(PlayerController):init(playerClass)
end

return playerClass