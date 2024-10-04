local Controls = {
	Text = "Button",
}

local Button = require(script.Parent.Button)
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)

return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		local label = Button(props)
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
