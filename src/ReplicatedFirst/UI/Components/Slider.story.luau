local Packages = game.ReplicatedStorage.Packages
local UILabs = require(game.ReplicatedStorage.UILabs)

local Controls = {
	Value = UILabs.Slider(0.5, 0, 1, 0.1),
}

local Slider = require(script.Parent.Slider)
local Fusion = require(Packages.Fusion)

return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		props.Position = UDim2.fromOffset(20, 15)
		local label = Slider(props)
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
