local Component = {}
Component.__index = Component

function Component.new()
    local self = setmetatable({}, Component)
    return self
end

return Component