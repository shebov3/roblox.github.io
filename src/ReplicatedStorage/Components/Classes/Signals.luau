local Signals = {}
Signals.__index = Signals

function Signals.new()
    local self = setmetatable({}, Signals)
    return self
end

return Signals