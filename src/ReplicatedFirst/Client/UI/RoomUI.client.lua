local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local UIComponents = ReplicatedFirst:WaitForChild("UI"):WaitForChild("Components")
local Fusion = require(Packages.Fusion)
local Lydie = require(Packages.Lydie)
local Button = require(UIComponents.Button)
local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local module = require(ReplicatedFirst.UI.Screens.Lobby)
local Children = Fusion.Children
local visible = Fusion.Value(true)

Fusion.New("ScreenGui")({
	Name = "RoomUI",
	Parent = PlayerGui,
	[Children] = {
		Button({
			Text = "Rooms",
			ForegroundColor = Color3.fromRGB(0, 0, 0),
			BackgroundOpacity = 0,
			BackgroundColor = Color3.fromRGB(255, 255, 255),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			OnClick = function()
				visible:set(not visible:get())
			end,
		}),
		module({ Visible = visible }),
	},
})
