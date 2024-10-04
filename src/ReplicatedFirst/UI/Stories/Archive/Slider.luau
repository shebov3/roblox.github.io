local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local Controls = Components.Controls
local Slider = Controls.Slider

return function(props)
	return Slider(props)
end
