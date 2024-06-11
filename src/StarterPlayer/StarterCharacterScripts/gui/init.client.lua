local replicatedStorage = game.ReplicatedStorage
local Fusion = require(replicatedStorage.Packages.Fusion)

local scoped = Fusion.scoped
local scope = scoped(Fusion)

scope:New("ScreenGui")({
	Parent = game.Players.LocalPlayer.PlayerGui,
	[Fusion.Children] = {
		scope:New("TextButton")({
			Text = "YES",
			TextSize = 16,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Font = Enum.Font.GothamBold,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(239, 31, 90),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
		}),
	},
})
