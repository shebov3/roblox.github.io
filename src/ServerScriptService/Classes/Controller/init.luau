local Controller = {}

--[[ Private Functions ]]
local function CreateController(Host: Player | Model): table
	local controller: ModuleScript = script.Instance:Clone()
	controller.Name = "Controller"
	controller.Parent = Host
	return require(controller)
end

--[[ Constructor ]]
function Controller.new(Host: Player | Model): table
	local self: table = CreateController(Host)
	setmetatable(self, Controller)
	self.Host = Host
	return self
end

return Controller
