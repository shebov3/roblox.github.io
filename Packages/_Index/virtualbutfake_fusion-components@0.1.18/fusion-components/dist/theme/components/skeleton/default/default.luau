local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Base = {
			Background = themeName == "Dark" and tailwind.neutral[700] or tailwind.neutral[100],
			Animation = themeName == "Dark" and tailwind.neutral[750] or tailwind.neutral[200],
		},
	}
end
