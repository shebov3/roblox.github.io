local Rooms = {}
Rooms.__index = Rooms

--[[ Objects ]]
local Packages = game.ReplicatedStorage.Packages

--[[ Modules ]]
local Warp = require(Packages.warp)

--[[ Variables ]]
local CreateRoomEvent = Warp.Server("CreateRoom")

CreateRoomEvent:Connect(function(Player, PlayersCapacity, FriendsOnly)
    local Controller = require(Player:FindFirstChild("Controller"))
    if not Controller.InRoom then return end

end)

return Rooms