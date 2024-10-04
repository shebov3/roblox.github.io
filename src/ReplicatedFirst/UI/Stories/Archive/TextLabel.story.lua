local Packages = game.ReplicatedStorage.Packages

local Controls = {
    Text = "SomeText"
}

local TextLabel = require(script.Parent.TextLabel)
local Fusion = require(Packages.Fusion)

return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		props.Position = UDim2.fromScale(.5,.5)
		local label = TextLabel(props)
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
