local playerClass = {}
--[[ Metatable ]]
playerClass.__index = function(self, key)
	return self.attributes[key] or playerClass[key]
end
playerClass.__newindex = function(self, index, value)
	local oldValue = self.attributes[index]
	if oldValue == value then
		return
	end
	self.attributes[index] = value
	self:changed(index, value)
end

--[[ Services ]]
local runService = game:GetService("RunService")

--[[ Variables ]]
local isServer = runService:IsServer()

--[[ Private Functions ]]
local function createController(player: Player): table
	local controller: ModuleScript = script.PlayerController:Clone()
	controller.Parent = player
	return require(controller)
end

local function init(controller: table)
	controller.money = 100
	controller.inventory = {}
end

--[[ Constructor ]]
function playerClass.new(player: Player): table
	local controller: table = createController(player)
	controller = setmetatable(controller, playerClass)
	init(controller)
	return controller
end

--[[ Public Functions ]]
function playerClass:changed(index: string, value: any)
	if isServer then
		print(`server attempt to update player {script.Parent} with {index} to {value}`)
		self.event:Fire(true, script.Parent, index, value)
	end
end

return playerClass
