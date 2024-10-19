local Rooms = {}
Rooms.__index = Rooms

--[[ Objects ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Packages = ReplicatedStorage.Packages
local Classes = game.ServerScriptService.Classes

--[[ Modules ]]
local Warp = require(Packages.warp)
local Room = require(Classes.Room)

--[[ Types ]]
type Room = Room.Room

--[[ Events ]]
local CreateRoomEvent = Warp.Server("CreateRoom")
local DeleteRoomEvent = Warp.Server("DeleteRoom")

local KickRoomEvent = Warp.Server("KickRoom")
local JoinRoomEvent = Warp.Server("JoinRoom")
local LeaveRoomEvent = Warp.Server("LeaveRoom")
local StartRoomEvent = Warp.Server("StartRoom")

--[[ Functions ]]
function Rooms:CreateRoom(Player, RoomCapacity, FriendsOnly)
	local HostRoom = Room.new(Player, RoomCapacity, FriendsOnly)
	table.insert(self, Player.Name, Room)
	return HostRoom
end

function Rooms:DeleteRoom(Player, HostRoom)
	table.remove(HostRoom, Player.Name)
end

--[[ Events ]]
CreateRoomEvent:Connect(function(Player: Player, RoomCapacity: number, FriendsOnly: boolean)
	local Controller = require(Player:FindFirstChild("Controller"))
	if not Controller.InRoom then
		return
	end
	local HostRoom = Rooms:CreateRoom(Player, RoomCapacity, FriendsOnly)
	Controller.InRoom = HostRoom
	CreateRoomEvent:Fire(true, Player)
end)

StartRoomEvent:Connect(function(Player: Player)
	local HostRoom = Rooms[Player.Name]
	if not HostRoom then
		return
	end
end)

DeleteRoomEvent:Connect(function(Player: Player)
	local Controller = require(Player:FindFirstChild("Controller"))
	if not Controller.InRoom then
		return
	end
	local HostRoom = Rooms[Player.Name]
	if not HostRoom then
		return
	end
	Rooms:DeleteRoom(Player, HostRoom)
end)

KickRoomEvent:Connect(function(Player: Player, TargetName: string)
	local HostRoom = Rooms[Player.Name]
	if not HostRoom then
		return
	end
	local Target = Players:FindFirstChild(TargetName)
	HostRoom:Remove(Target)
end)

JoinRoomEvent:Connect(function(Player, HostName) end)

LeaveRoomEvent:Connect(function(Player) end)

return Rooms
