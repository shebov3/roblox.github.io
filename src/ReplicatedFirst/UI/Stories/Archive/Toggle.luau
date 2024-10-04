local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local Controls = Components.Controls
local Toggle = Controls.Toggle

return function(props)
	return Toggle(props)
end
