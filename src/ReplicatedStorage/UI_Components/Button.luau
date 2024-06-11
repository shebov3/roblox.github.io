local replicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(replicatedStorage.Packages.Fusion)
local scoped = Fusion.scoped(Fusion)

local function Button(props)
	local controls = props.controls
	if controls.text == "" then
		controls.text = "Hello World"
	end
	return scoped:New("TextButton")({
		Text = controls.text,
		Parent = controls.Parent,
		TextSize = 16,
		Font = Enum.Font.GothamBold,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundColor3 = Color3.fromRGB(239, 31, 90),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
	})
end

return Button
