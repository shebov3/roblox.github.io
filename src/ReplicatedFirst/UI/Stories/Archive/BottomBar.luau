local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Fusion = require(Packages.Fusion)
local new = Fusion.New
local Children = Fusion.Children
local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local Views = Components.Views
local bottomBar = Views.BottomAppBar
local appTabBar = Views.AppTabBar
local app = Components.Controls.AppTabBarButton

return function(props)
	return bottomBar({
		ZIndex = 2,
		[Children] = {
			appTabBar({
				[Children]={
					props.apps or app({}),
				}
			})
		},
	})
end
