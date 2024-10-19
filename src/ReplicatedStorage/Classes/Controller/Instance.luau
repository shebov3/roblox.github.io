local host = script.Parent
local controller = {}
controller.server = { private = {}, public = {} }

--[[ Services ]]
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

--[[ Modules ]]
local warp = require(replicatedStorage.Packages.warp)

--[[ Variables ]]
local isServer = runService:IsServer()
local id = "controller_" .. host.Name
controller.server.player = host:IsA("Player") and host or game.Players:GetPlayerFromCharacter(host)

--[[ Public Functions ]]
function controller:getSelf()
    if not controller.server.player then
        return
    end
    if isServer then
        self = self.server
    else
        self = self.client
    end
    return self
end

if controller.server.player then
    controller.client = { private = {}, public = {} }

    if isServer then
        controller.server.event = warp.Server(id .. "_server")
        controller.client.event = warp.Server(id .. "_client", { rateLimit = { maxEntrance = 20, interval = 2 } })
        controller.client.event:Connect(function(_, index, value)
            controller.client.public[index] = value
        end)
    else
        controller.client.event = warp.Client(id .. "_client")
        controller.server.event = warp.Client(id .. "_server")
        controller.server.event:Connect(function(index, value)
            controller.server.public[index] = value
        end)
    end
end

return controller