local fusion = require(script.Parent.Parent:WaitForChild('fusion'))

function use<T>(input: fusion.CanBeState<T>): T
	if typeof(input) == "table" and input.get then
		return input:get()
	else
		return input :: T
	end
end

return use
