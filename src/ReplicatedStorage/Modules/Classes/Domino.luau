local dominoClass = {}

--[[ Metatable ]]
dominoClass.__index = dominoClass
dominoClass.__eq = dominoClass.isEqual

--[[ Types ]]
export type domino = {
	model: MeshPart,
	value: { number },
}

--[[ Private Functions ]]
local function value(model)
	local name: string = model.Name
	local first, second = name:match("(%d)(%d)")
	return { tonumber(first), tonumber(second) }
end

--[[ Constructor ]]
function dominoClass.new(model: MeshPart): domino
	local self: domino = setmetatable({}, dominoClass)
	self.model = model:Clone()
	self.value = value(model)
	return self
end

--[[ Public Functions ]]
function dominoClass:isEqual(domino: domino): boolean
	return self.Value == domino.Value
end

return dominoClass
