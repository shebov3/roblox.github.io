local Components = {}
for _, Child in pairs(script:GetChildren()) do
    local Component = require(Child)
    table.insert(Components, Child.Name, Component)
end

return Components