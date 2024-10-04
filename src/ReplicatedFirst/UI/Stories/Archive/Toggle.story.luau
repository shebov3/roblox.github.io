local Packages = game.ReplicatedStorage.Packages

local Controls = {
}

local Toggle = require(script.Parent.Toggle)
local Fusion = require(Packages.Fusion)

return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		props.Position = UDim2.fromOffset(50, 40)
		local label = Toggle(props)
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
