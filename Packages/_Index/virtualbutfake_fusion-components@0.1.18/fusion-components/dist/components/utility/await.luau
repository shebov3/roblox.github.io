local fusion = require(script.Parent.Parent.Parent.Parent:WaitForChild('fusion'))
local Computed = fusion.Computed

local fusionUtils = require(script.Parent.Parent.Parent.Parent:WaitForChild('fusionUtils'))
local use = fusionUtils.use

type props = {
	Loaded: fusion.StateObject<boolean>,
	TemporaryContent: fusion.CanBeState<{ any }>,
	Children: fusion.CanBeState<{ any }>
}

local function await(props: props): fusion.Computed<{ any }>
	return Computed(function()
		return props.Loaded:get() and use(props.Children) or use(props.TemporaryContent)
	end)
end

return await
