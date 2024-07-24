local Domino = {}

--[[ Metatable ]]
Domino.__index = Domino
Domino.__eq = Domino.isEqual

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
function Domino.new(model: MeshPart, parent: Folder): domino
	local self: domino = setmetatable({}, Domino)
	self.model = model:Clone()
	self.model.Parent = parent
	self.value = value(model)
	return self
end

--[[ Public Functions ]]
function Domino:isDouble(): boolean
	return self.value[1] == self.value[2]
end

function Domino:isEqual(domino: domino): boolean
	return self.value == domino.value
end

return Domino
