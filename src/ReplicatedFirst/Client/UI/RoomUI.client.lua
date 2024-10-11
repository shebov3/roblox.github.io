local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local UI = ReplicatedFirst:WaitForChild("UI")
local Lobby = require(UI.Lobby)
local Fusion = require(Packages.Fusion)
local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local Children = Fusion.Children

Fusion.New("ScreenGui")({
	Name = "RoomUI",
	Parent = PlayerGui,
	[Children] = {
		Lobby()
	},
})
