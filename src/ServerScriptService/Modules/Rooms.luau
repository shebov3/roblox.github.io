local Rooms = {}
Rooms.__index = Rooms

--[[ Objects ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Classes = game.ServerScriptService.Classes

--[[ Modules ]]
local Warp = require(Packages.warp)
local Room = require(Classes.Room)

--[[ Variables ]]
local CreateRoomEvent = Warp.Server("CreateRoom")

CreateRoomEvent:Connect(function(Player, PlayersCapacity, FriendsOnly)
	local Controller = require(Player:FindFirstChild("Controller"))
	if not Controller.InRoom then
		return
	end
	table.insert(Rooms, Player.Name, Room.new(Player, PlayersCapacity, FriendsOnly))
end)

return Rooms
