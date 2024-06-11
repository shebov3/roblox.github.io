local Button = require(script.Parent.Button)

local controls = {
	text = "Hello world",
	enabled = true,
}

type Props = {
	controls: typeof(controls),
}

return {
	summary = "this is some story",
	controls = controls,
	story = function(parent, props)
		props.controls.Parent = parent
		local label = Button(props)
		return function()
			return label:Destroy()
		end
	end,
}
