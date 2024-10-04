local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children
local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local topBar = require(script.Parent.TopBar)
local Views = Components.Views
local Window = Views.Window
local bottomBar = require(script.Parent.BottomBar)
return function(props)
	props[Children] = {
		topBar(props),
		props.Frames,
		bottomBar(props),
	}
	return Window(props)
end
