local playerController = require(game.Players.LocalPlayer:WaitForChild("Controller"))
--local characterController = require(game.Players.LocalPlayer.Character:WaitForChild("Controller"))
local replicatedStorage = game:GetService("ReplicatedStorage")

--[[ Modules ]]
local iris = require(replicatedStorage.Packages.iris)
iris.Init()

local function loop(i, table: table)
	iris.Tree({ `{i}` })
	for index, value in pairs(table) do
		if type(value) == "table" then
			loop(index, value)
		else
			iris.Text({ `{index} = {value}` })
		end
	end
	iris.End()
end

iris:Connect(function()
	local windowSize = iris.State(Vector2.new(300, 200))
	iris.Window({ "Client" }, { size = windowSize })
	loop("PlayerController", playerController.server.public)
	--loop("CharacterController", characterController.server.public)
	iris.End()
end)
