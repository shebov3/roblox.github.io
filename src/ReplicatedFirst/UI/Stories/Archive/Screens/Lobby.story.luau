local Packages = game.ReplicatedStorage.Packages

local Lobby = require(script.Parent.Lobby)
local Fusion = require(Packages.Fusion)

return {
	fusion = Fusion,
	story = function(props)
		props.Visible = Fusion.Value(true)
		local component = Lobby(props)
		component.Parent = props.target

		return function()
			component:Destroy()
		end
	end,
}
