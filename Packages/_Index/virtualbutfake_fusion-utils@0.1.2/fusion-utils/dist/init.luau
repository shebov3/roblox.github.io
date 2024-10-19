local propertyProvider = require(script:WaitForChild('propertyProvider'))
local awaitLayer = require(script:WaitForChild('awaitLayer'))
local getState = require(script:WaitForChild('getState'))
local onDestroy = require(script:WaitForChild('onDestroy'))
local use = require(script:WaitForChild('use'))
local peek = require(script:WaitForChild('peek'))
local sizeFromLayer = require(script:WaitForChild('sizeFromLayer'))
local topLayerProvider = require(script:WaitForChild('topLayerProvider'))

local index = {
	propertyProvider = propertyProvider,
	awaitLayer = awaitLayer,
	getState = getState,
	onDestroy = onDestroy,
	use = use,
	peek = peek,
	sizeFromLayer = sizeFromLayer,
	topLayerProvider = topLayerProvider,
}

export type layer = topLayerProvider.layer

return index
