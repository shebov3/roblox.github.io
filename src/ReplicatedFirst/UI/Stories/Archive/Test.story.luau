local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
local FusionComponents = require(game.ReplicatedStorage.Packages.fusionComponents)

return {
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		local label = FusionComponents.common.button({
			Color = "red",
			Variant = "solid",
			ButtonText = "Example text",
			Icon = "mouse-pointer-click",
			AutomaticSize = Enum.AutomaticSize.XY,
		})
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
