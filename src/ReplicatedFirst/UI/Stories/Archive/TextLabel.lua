local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)

return function(props)
	return Fusion.New("TextLabel")({
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = props.Text or "Test",
		Position = props.Position or UDim2.new(0.5, 0, 0.5, 0),
		TextSize = 24,
		Font = Enum.Font.GothamMedium,
	})
end
