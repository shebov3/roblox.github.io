local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Container = {
			Background = { color = themeName == "Dark" and tailwind.neutral[800] or tailwind.neutral[100], shadow = 2 },
			Stroke = themeName == "Dark" and tailwind.neutral[700] or tailwind.neutral[200],
		},
		Base = {
			Text = themeName == "Dark" and tailwind.neutral[200] or tailwind.neutral[700],
		},
		Hover = {
			Background = {
				color = themeName == "Dark" and tailwind.neutral[900] or tailwind.neutral[200],
				transparency = 0.5,
			},
			Text = themeName == "Dark" and tailwind.neutral[200] or tailwind.neutral[700],
		},
		Press = {
			Background = themeName == "Dark" and { color = tailwind.neutral[900], transparency = 0.5 }
				or { color = tailwind.neutral[200], transparency = 0.1 },
			Text = themeName == "Dark" and tailwind.neutral[100] or tailwind.neutral[700],
		},
		Active = {
			Background = { color = themeName == "Dark" and tailwind.neutral[900] or tailwind.white, shadow = 2 },
			Text = themeName == "Dark" and tailwind.white or tailwind.neutral[900],
		},
		Disabled = {
			Text = themeName == "Dark" and tailwind.neutral[500] or tailwind.neutral[400],
		},
		ActiveDisabled = {
			Background = {
				color = themeName == "Dark" and tailwind.neutral[500] or tailwind.neutral[400],
				transparency = 0.5,
			},
			Text = themeName == "Dark" and tailwind.neutral[500] or tailwind.neutral[400],
		},
	}
end
