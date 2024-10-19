local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Base = {
			Background = {
				color = themeName == "Dark" and tailwind.neutral[700] or tailwind.neutral[50],
				transparency = themeName == "Dark" and 0.75 or 0.25,
			},
			Stroke = themeName == "Dark" and tailwind.neutral[700] or tailwind.neutral[200],
			Text = themeName == "Dark" and tailwind.neutral[300] or tailwind.neutral[700],
		},
	}
end
