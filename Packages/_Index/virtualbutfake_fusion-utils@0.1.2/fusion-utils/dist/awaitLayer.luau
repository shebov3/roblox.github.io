-- wrapper for reactive topLayerProvider.getLayer
local fusion = require(script.Parent.Parent:WaitForChild('fusion'))
local Clean = fusion.cleanup
local Computed = fusion.Computed
local Value = fusion.Value

local topLayerProvider = require(script.Parent:WaitForChild('topLayerProvider'))
local use = require(script.Parent:WaitForChild('use'))

return function(object: GuiObject, callback: (layer: topLayerProvider.layer) -> any): nil
	local parent = Value(object.Parent :: GuiObject)

	local layerComputed
	local updateValue = Value(false)

	local connection = object.AncestryChanged:Connect(function()
		parent:set(object.Parent)
		updateValue:set(true)
		-- we just trigger an update here
		-- i don't know why this works, since computeds should update anyways, no?
		-- but hey :shrug:
		layerComputed:get()
	end)

	local handled = false

	layerComputed = Computed(function()
		if updateValue:get() then
			updateValue:set(false)
		end

		local layer = topLayerProvider.getLayer(use(parent))

		if layer and not handled then
			handled = true
			connection:Disconnect()
			return callback(layer)
		end

		return nil
	end, Clean)

	return nil
end
