local runService = game:GetService("RunService")
local controllerClass = {}

--[[ Metatable ]]
controllerClass.__index = function(self, key)
	return self.public[key] or controllerClass[key]
end
controllerClass.__newindex = function(self, index, value)
	if self.public[index] == value then
		return
	end
	self.public[index] = value
	if not self.player then
		return
	end
	self:changed(index, value)
end

--[[ Private Functions ]]
local function createController(host: Player | Model): table
	local controller: ModuleScript = script.Instance:Clone()
	controller.Name = "Controller"
	controller.Parent = host
	return require(controller)
end

--[[ Constructor ]]
function controllerClass.new(host: Player | Model): table
	local self: table = createController(host)
	setmetatable(self:getSelf(), controllerClass)
	return self
end

function controllerClass.getController(host: Player | Model): table
	local self = require(host:WaitForChild("Controller"))
	setmetatable(self:getSelf(), controllerClass)
	return self
end

--[[ Public Functions ]]
function controllerClass:changed(index: string, value: any)
	if runService:IsServer() then
		self.event:Fire(true, self.player, index, value)
	else
		self.event:Fire(true, index, value)
	end
end

return controllerClass
