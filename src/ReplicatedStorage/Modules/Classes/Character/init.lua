local characterClass = {}

--[[ Metatable ]]
characterClass.__index = characterClass

--[[ Modules ]]
local deckClass = require(game.ReplicatedStorage.Modules.Classes.Deck)

--[[ Private Functions ]]
local function createController(character: Model) : table
	local controller: ModuleScript = script.CharacterController:Clone()
	controller.Parent = character
	return require(controller)
end

local function init(controller)
	controller.deck = deckClass.new()
end

--[[ Constructor ]]
function characterClass.new(character: Model): table
	local controller = createController(character)
	controller = setmetatable(controller, characterClass)
	init(controller)
	return controller
end

return characterClass
