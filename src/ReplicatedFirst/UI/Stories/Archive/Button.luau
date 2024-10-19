local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local Controls = Components.Controls
local Button = Controls.TextButton

return function(props)
	local controls = props.controls or {}
	props.Text = controls.Text or props.Text
	return Button(props)
end
