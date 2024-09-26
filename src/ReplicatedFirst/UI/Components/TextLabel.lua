local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)

return function(props)
	return Fusion.New("TextLabel")({
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = props.Text,
		Position = props.Position,
		TextSize = 24,
		Font = Enum.Font.GothamMedium,
	})
end
