local playerController = {}
playerController.attributes = {}

--[[ Services ]]
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

--[[ Modules ]]
local warp = require(replicatedStorage.Packages.warp)

--[[ Variables ]]
local isServer = runService:IsServer()
local userId = tostring(script.parent.UserId)

if isServer then
	print("Server Ready")
	playerController.event = warp.Server(userId)
else
	print("Client Listening")
	playerController.event = warp.Client(userId)
	playerController.event:Connect(function(player, index, value)
		playerController.attributes[index] = value
		print(`{player} has updated {index} to {value} in the client`)
	end)
    print(playerController.event)
end

return playerController
