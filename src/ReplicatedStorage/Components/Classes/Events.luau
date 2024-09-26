local Events = {}
Events.__index = Events

function Events.new()
    local self = setmetatable({}, Events)
    return self
end

return Events