local Room = {}
Room.__index = Room

function Room.new(Model)
    local self = setmetatable({}, Room)
    self.Players = {}
    self.Model = Model
    self.Count = 0
    return self
end

function Room:HasPlayer(Player): boolean
    return self.Players[Player.Name] ~= nil
end

function Room:AddPlayer(Player)
    self.Count += 1
    self.Players[Player.Name] = Player
    self.Model.Main.SurfaceGui.Frame.Players.Text = self.Count.."/4"
end

function Room:RemovePlayer(Player)
    
end

return Room