local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Lydie = require(Packages.Lydie)
local Fusion = require(Packages.Fusion)

local Components = Lydie.Components
local Icons = Lydie.Modules.Icons
local Controls = Components.Controls
local TextLabel = require(script.Parent.TextLabel)
return function(props)
	local controls = props.controls or {}
	props.Text = controls.Text or props.Text
	return Fusion.New("Frame")({
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(0.5, 10, 0.1, 10),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(220, 220, 220),
		[Fusion.Children] = {
			Fusion.New("UICorner")({}),
			TextLabel({
				Text = props.Text or "PlayerName",
			}),
			Controls.IconButton({
				Icon = Icons["log-out"],
				Position = UDim2.new(0.99, -15, 0.5, 0),
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
			}),
		},
	})
end
