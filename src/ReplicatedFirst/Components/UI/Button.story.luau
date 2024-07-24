local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
local controls = {
	text = "Functional Story",
}

type Props = {
	controls: typeof(controls),
}

return {
	summary = "This story uses a function with a cleanup callback to create and mount the gui elements. This works similarly to Hoarcekat stories but also supports controls and other metadata. Check out the source to learn more",
	controls = controls,
	story = function(Parent: GuiObject, props: Props)
		local label = Fusion.New("TextLabel")({
			Parent = Parent,
			Text = props.controls.text,
			Font = Enum.Font.Gotham,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 16,
			AutomaticSize = Enum.AutomaticSize.XY,
		})
		return function()
			label:Destroy()
		end
	end,
}
