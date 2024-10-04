local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Base = {
			Background = { color = themeName == "Dark" and tailwind.neutral[900] or tailwind.white, shadow = 1 },
			Stroke = themeName == "Dark" and tailwind.neutral[700] or tailwind.neutral[300],
			Text = themeName == "Dark" and tailwind.white or tailwind.neutral[900],
		},
	}
end
