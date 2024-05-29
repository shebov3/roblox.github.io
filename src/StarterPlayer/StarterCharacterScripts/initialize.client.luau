local Fusion = require(game.ReplicatedStorage.Packages.fusion)
local Lydie = require(game.ReplicatedStorage.Packages.lydie)

local scoped = Fusion.scoped
local scope = scoped({ Value = Fusion.Value, New = Fusion.New })

local textState = scope:Value("Hello world!")
local Children = Fusion.Children

local _instance = scope:New("Part")({
	Parent = workspace,
	Size = Vector3.new(5, 1, 5),
	Color = Color3.new(1, 0, 0),
})

local button = Lydie.Components.Controls
	.BaseButton({
		BackgroundColor = Color3.fromRGB(255, 86, 86),
		BackgroundOpacity = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(200, 40),
		[Children] = {
			scope:New("TextLabel")({
				Text = textState,
			}),
		},
		OnClickDown = function()
			textState:set("Hello world??")
		end,
		OnClick = function()
			textState:set("Hello world!")
		end,
	})
	:Clone()

button.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("Main")
