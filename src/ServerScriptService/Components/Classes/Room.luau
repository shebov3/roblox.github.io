local Room = {}
Room.__index = Room

local Players = game:GetService("Players")

local function UpdateUI(self)
	self.Model.Main.SurfaceGui.Frame.Players.Text = `{self.Count}/{self.Capacity}`
end

local function Init(self)
	self.Model.Main.Touched:Connect(function(part: BasePart)
		local Character = part.Parent
		local Player = Players:GetPlayerFromCharacter(Character)
		if not Player then
			return
		end
		self:AddPlayer(Player)
		local RootPart = Character.HumanoidRootPart
		RootPart.CFrame = self.Model.Top.CFrame * CFrame.new(0, -10, 0)
	end)
end

function Room.new(Model, Capacity)
	local self = setmetatable({}, Room)
	self.Players = {}
	self.Capacity = Capacity or 4
	self.Count = 0
	self.Model = Model
	Init(self)
	return self
end

function Room:AddPlayer(Player: Player)
	local playerController = require(Player.Controller)
	if playerController.InRoom then
		return
	end
	playerController.InRoom = true
	self.Count += 1
	self.Players[Player.Name] = Player
	self.Event:Fire(true, Player, true)
	UpdateUI(self)
end

function Room:RemovePlayer(Player: Player)
	local playerController = require(Player.Controller)
	if not playerController.InRoom then
		return
	end
	playerController.InRoom = false
	self.Count -= 1
	self.Players[Player.Name] = nil
	UpdateUI(self)
end

return Room
