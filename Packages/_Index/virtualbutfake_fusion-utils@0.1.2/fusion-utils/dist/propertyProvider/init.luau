local module = {}
local types = require(script:WaitForChild('types'))

function module.getProps(props: { [any]: any }, instanceType: string): { [string]: any }
	local validProps = types[instanceType]

	if not validProps then
		return props
	end

	local newProps = table.clone(props)

	for key in newProps do
		if not validProps[key] then
			newProps[key] = nil
		end
	end

	return newProps
end

function module.getPropsAndSpecialKeys(props: { [any]: any }, instanceType: string): { [any]: any }
	local validProps = types[instanceType]

	if not validProps then
		return props
	end

	local newProps = table.clone(props)

	for key in newProps do
		if typeof(key) ~= "string" then
			continue
		end

		if not validProps[key] then
			newProps[key] = nil
		end
	end

	return newProps
end

return module
