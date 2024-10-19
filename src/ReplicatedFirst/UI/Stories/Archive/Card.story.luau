local Card = require(script.Parent.Card)
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)

return {
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		local label = Card(props)
		label.Parent = props.target
		return function()
			label:Destroy()
		end
	end,
}
