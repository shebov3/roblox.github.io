local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Window = require(game.ReplicatedFirst.UI.Components.Window)

local New = Fusion.New
local Children = Fusion.Children
local Components = require(Packages.fusionComponents)
local Button = Components.common.button
local Slider = Components.common.slider
local InputMenu = Components.common.inputMenu
local CheckBox = Components.common.checkbox

local HorizontalPadding = function()
	return New("UIListLayout")({
		Padding = UDim.new(0.1, 0),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
end

local VerticalPadding = function()
	return New("UIListLayout")({
		Padding = UDim.new(0.1, 0),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
end

local TextLabel = function(Text)
	return New("TextLabel")({
		Text = Text,
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamMedium,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(0.3, 1),
	})
end


return function(props)
	props = props or {}
	local FriendsOnly = Fusion.Value(false)
	props.Content = {
		New("Frame")({
			Name = "CreateRoom",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[Children] = {
				VerticalPadding(),
				New("Frame")({
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0.06),
					[Children] = {
						HorizontalPadding(),
						TextLabel("Room Capacity:"),
						New("Frame")({
							BackgroundTransparency = 1,
							Size = UDim2.new(.3, 0, .5, 0),
							[Children] = {
								Slider({
									Color = "red",
									Min = 2,
									Max = 4,
									Tooltip = true,
									Value = 3,
									Step = 1,
									Width = UDim.new(1, 0),
								}),
							},
						}),
					},
				}),
				New("Frame")({
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0.06),
					[Children] = {
						HorizontalPadding(),
						TextLabel("Friends Only:"),
						New("Frame")({
							BackgroundTransparency = 1,
							Size = UDim2.new(0.3, 0, 1, 0),
							[Children] = {
								New("Frame")({
									BackgroundTransparency = 0.5,
									Size = UDim2.fromScale(0, 0),
									Position = UDim2.fromScale(0.5, 0.5),
									AnchorPoint = Vector2.new(0.5, 0.5),
									[Children] = {
										CheckBox({
											Color = "red",
											State = FriendsOnly,
											OnClick = function()
												FriendsOnly:set(not FriendsOnly:get())
											end,
										}),
									},
								}),
							},
						}),
					},
				}),
				Button({
					Color = "red",
					Variant = "solid",
					ButtonText = { Label = "Create Room", TextSize = 20, Font = Enum.Font.GothamMedium },

					AutomaticSize = Enum.AutomaticSize.XY,
				}),
			},
		}),
	}
	props.Apps = {
		Button({
			Name = "CreateRoom",
			Color = "black",
			Variant = "solid",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -15, 0.5, 0),
			Size = UDim2.new(0, 16, 0, 16),
			ScaleType = Enum.ScaleType.Fit,
			Icon = { Name = "plus", Size = 24 },
		}),
		Button({
			Name = "SearchRoom",
			Color = "black",
			Variant = "solid",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -15, 0.5, 0),
			Size = UDim2.new(0, 16, 0, 16),
			ScaleType = Enum.ScaleType.Fit,
			Icon = { Name = "layout-grid", Size = 24 },
		}),
	}
	return Window(props)
end
