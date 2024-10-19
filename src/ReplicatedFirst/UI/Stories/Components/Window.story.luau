local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Window = require(game.ReplicatedFirst.UI.Components.Window)
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Components = require(Packages.fusionComponents)
local Frame = Components.base.frame
local Button = Components.common.button

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
		props.Apps = {
			Button({
				Name = "CreateRoom",
				Color = "black",
				Variant = "solid",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -15, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16),
				ScaleType = Enum.ScaleType.Fit,
				Icon = { Name = "plus", Size = 24 },
			}),
			Button({
				Name = "SearchRoom",
				Color = "black",
				Variant = "solid",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -15, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16),
				ScaleType = Enum.ScaleType.Fit,
				Icon = { Name = "layout-grid", Size = 24 },
			}),
		}
		local window = Window(props)
		window.Parent = props.target
		return function()
			window:Destroy()
		end
	end,
}
