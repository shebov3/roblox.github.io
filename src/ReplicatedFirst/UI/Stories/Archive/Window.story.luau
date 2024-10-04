local UILabs = require(game.ReplicatedStorage.UILabs)

local Controls = {
	Title = "Title",
	Subtitle = "Subtitle",
	Visible = true,
	AspectRatio = 1.75,
}

local Button = require(script.Parent.Button)
local Container = require(script.Parent.Container)
local Slider = require(script.Parent.Slider)
local Window = require(script.Parent.Window)
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
local Frame = require(script.Parent.Frame)
local sliderValue = Fusion.Value(0)
local Toggle = require(script.Parent.Toggle)
return {
	controls = Controls,
	fusion = Fusion,
	story = function(props)
		for i, v in pairs(props.controls) do
			props[i] = v
		end
		props.controls = nil
		props.Frames = Frame({
			Children = {
				Container({
					Children = {
						Slider({ Value = sliderValue }),
						Button({
							Text = "Cool",
						}),
					},
				}),
				Container({
					Children = { Toggle({}), Toggle({}) },
				}),
				Button({ Text = "Button" }),
			},
		})

		props.Position = UDim2.new(0.5, 0, 0.5, -100)
		local component = Window(props)
		component.Parent = props.target
		return function()
			component:Destroy()
		end
	end,
}
