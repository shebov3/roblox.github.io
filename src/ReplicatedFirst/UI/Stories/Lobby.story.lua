local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Lobby = require(game.ReplicatedFirst.UI.Lobby)

local Controls = {
	Title = "Title",
	Subtitle = "Subtitle",
}

return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		local window = Lobby(props)
		window.Parent = props.target
		return function()
			window:Destroy()
		end
	end,
}
