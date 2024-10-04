local tailwind = require(script.Parent.Parent.Parent.Parent.Parent.Parent:WaitForChild('tailwind'))

return function(themeName: string)
	return {
		Base = {
			Background = themeName == "Dark" and tailwind.white or tailwind.neutral[900],
			Text = themeName == "Dark" and tailwind.neutral[900] or tailwind.white,
		},
	}
end
