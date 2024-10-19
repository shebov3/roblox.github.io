local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Base = {
			Text = themeName == "Dark" and tailwind.white or tailwind.neutral[900],
		},
	}
end
