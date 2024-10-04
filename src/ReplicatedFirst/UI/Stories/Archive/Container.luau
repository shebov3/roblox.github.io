local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Fusion = require(Packages.Fusion)
local new = Fusion.New
local Children = Fusion.Children
return function(props)
	return new("Frame")({
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
		[Children] = {
			Fusion.New("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = props.Padding,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			}),
			table.unpack(props.Children),
		},
	})
end
