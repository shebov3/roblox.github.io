local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Window = require(game.ReplicatedFirst.UI.Components.Window)
local RunSerivce = game:GetService("RunService")

--[[ Variables ]]
local FriendsOnly = Fusion.Value(false)
local AdvancedOptions = Fusion.Value(false)
local RoomCapacity = Fusion.Value(3)
local RoomWindow = Fusion.Value(true)

local CreateRoomEvent = setmetatable({}, {
	__index = function()
		return function() end
	end,
})

if RunSerivce:IsRunning() then
	local Warp = require(Packages.warp)
	CreateRoomEvent = Warp.Client("CreateRoom")
end

CreateRoomEvent:Connect(function()
	RoomWindow:set(true)
end)

local New = Fusion.New
local Children = Fusion.Children
local Components = require(Packages.fusionComponents)
local Button = Components.common.button
local Frame = Components.base.frame
local Badge = Components.common.badge
local Slider = Components.common.slider
local InputMenu = Components.common.inputMenu
local CheckBox = Components.common.checkbox

local VerticalPaddingValue = Fusion.Value(UDim.new(0.1, 0))

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
		Padding = Fusion.Tween(VerticalPaddingValue, TweenInfo.new(0.4, Enum.EasingStyle.Quad)),
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
	props.Content = {
		New("Frame")({
			Name = "Room",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[Children] = {
				New("Frame")({
					Name = "Create",
					Visible = Fusion.Computed(function() return not RoomWindow:get() end),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
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
									Size = UDim2.new(0.3, 0, 0.5, 0),
									[Children] = {
										Slider({
											Color = "red",
											Min = 2,
											Max = 4,
											Tooltip = true,
											Value = RoomCapacity,
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
						--#region Advanced Options
						-- New("Frame")({
						-- 	BackgroundTransparency = 1,
						-- 	Size = Fusion.Tween(
						-- 		Fusion.Computed(function()
						-- 			return if AdvancedOptions:get() then UDim2.fromScale(0.9, 0.6) else UDim2.fromScale(.25, 0.05)
						-- 		end),
						-- 		TweenInfo.new(0.5, Enum.EasingStyle.Quad)
						-- 	),
						-- 	[Children] = {
						-- 		Button({
						-- 			Color = "black",
						-- 			Variant = "solid",
						-- 			Icon = { Name = "settings", Size = 16 },
						-- 			ButtonText = {
						-- 				Label = "Advanced Options",
						-- 				TextSize = 16,
						-- 				FontStyle = Enum.Font.GothamMedium,
						-- 			},
						-- 			AutomaticSize = Enum.AutomaticSize.XY,
						-- 			OnClick = function()
						-- 				AdvancedOptions:set(not AdvancedOptions:get())
						-- 				if AdvancedOptions:get() then
						-- 					VerticalPaddingValue:set(UDim.new(.05, 0))
						-- 				else
						-- 					VerticalPaddingValue:set(UDim.new(.1, 0))
						-- 				end
						-- 			end,
						-- 			ZIndex = 2,
						-- 		}),
						-- 		Frame({
						-- 			Visible = true,
						-- 			CornerRadius = 8,
						-- 			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						-- 			BackgroundTransparency = Fusion.Tween(
						-- 				Fusion.Computed(function()
						-- 					return if AdvancedOptions:get() then 0 else 1
						-- 				end),
						-- 				TweenInfo.new(0.5, Enum.EasingStyle.Quad)
						-- 			),
						-- 			Size = UDim2.fromScale(1, 1),
						-- 			[Children] = {},
						-- 		}),
						-- 	},
						-- }),
						--#endregion
						Button({
							Color = "red",
							Variant = "solid",
							ButtonText = {
								Label = "Create Room",
								TextSize = 20,
								FontStyle = Enum.Font.GothamMedium,
							},
							AutomaticSize = Enum.AutomaticSize.XY,
							LayoutOrder = 0,
							OnClick = function()
								CreateRoomEvent:Fire(true, RoomCapacity, FriendsOnly)
							end,
						}),
					},
				}),
				New("Frame")({
					Visible = RoomWindow,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					[Children] = {
						VerticalPadding(),
						New("Frame")({
							BackgroundTransparency = 0,
							Size = UDim2.fromScale(1, .4),
							[Children] = {
								
							},
						}),
						Button({
							Color = "red",
							Variant = "solid",
							ButtonText = {
								Label = "Start Room",
								TextSize = 20,
								FontStyle = Enum.Font.GothamMedium,
							},
							AutomaticSize = Enum.AutomaticSize.XY,
							LayoutOrder = 0,
							OnClick = function()
								CreateRoomEvent:Fire(true, RoomCapacity, FriendsOnly)
							end,
						}),
					},
				}),
			},
		}),
		New("Frame")({
			Name = "SearchRoom",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[Children] = New("Frame")({
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[Children] = {},
			}),
		}),
	}

	props.Apps = {
		Button({
			Name = "Room",
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
