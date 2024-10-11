local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local Components = require(Packages.fusionComponents)
local Frame = Components.base.frame
local Button = Components.common.button
local Slider = Components.common.slider
local layer = require(Packages.fusionUtils).topLayerProvider

return function(props)
	for _, App in pairs(props.Apps) do
		App.MouseButton1Click:Connect(function()
			if props.Content == nil then return end
			for _, Page in pairs(props.Content) do
				if Page.Name == App.Name then
					Page.Visible = true
				else
					Page.Visible = false
				end
			end
		end)
	end

	local Window = layer.new(Frame({
		BackgroundColor3 = Color3.fromRGB(220, 220, 230),
		Size = props.Size or UDim2.new(0.25, 250, 0.2, 250),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		CornerRadius = 4,
		Content = {
			
			Frame({
				Name = "Top",
				CornerRadius = 8,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				Size = UDim2.new(1, 0, 0, 40),
				AnchorPoint = Vector2.new(0, 0),
				Content = {
					New("Frame")({
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -50, 1, 0),
						[Children] = {
							New("UIListLayout")({
								FillDirection = Enum.FillDirection.Horizontal,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								SortOrder = Enum.SortOrder.LayoutOrder,
							}),
							Components.base.icon({
								Name = "Icon",
								Size = UDim2.new(0, 50, 0.5, 0),
								ScaleType = Enum.ScaleType.Fit,
								Icon = { Name = "info", Size = 32 },
								ImageColor3 = Color3.fromRGB(0, 0, 0),
								BackgroundTransparency = 1,
								LayoutOrder = 0,
							}),
							New("Frame")({
								Size = UDim2.new(0, 200, 1, 0),
								BackgroundTransparency = 1,
								AutomaticSize = Enum.AutomaticSize.X,
								LayoutOrder = 1,
								[Children] = {
									New("UIListLayout")({
										FillDirection = Enum.FillDirection.Vertical,
										VerticalAlignment = Enum.VerticalAlignment.Center,
										SortOrder = Enum.SortOrder.LayoutOrder,
									}),
									New("TextLabel")({
										AutomaticSize = Enum.AutomaticSize.X,

										Size = UDim2.new(0, 0, 0.4, 0),
										Text = props.Title or "Title",
										TextSize = 16,
										Font = Enum.Font.GothamBold,
									}),
									New("TextLabel")({
										AutomaticSize = Enum.AutomaticSize.X,
										Size = UDim2.new(0, 0, 0.2, 0),
										Text = props.Subtitle or "Subtitle",
										TextSize = 12,
										Font = Enum.Font.GothamMedium,
									}),
								},
							}),
						},
					}),
					Button({
						Color = "black",
						Variant = "solid",
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -5, 0.5, 0),
						Size = UDim2.new(0, 25, 0, 25),
						ScaleType = Enum.ScaleType.Fit,
						Icon = { Name = "x", Size = 24 },
					}),
				},
			}),
			Frame({
				Name = "Middle",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -80),
				Position = UDim2.new(0, 0, 0, 40),
				Content = {
					props.Content,
				},
			}),
			Frame({
				Name = "Bottom",
				CornerRadius = 4,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				Size = UDim2.new(1, 0, 0, 40),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				Content = {
					New("UIListLayout")({
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10),
					}),
					props.Apps,
				},
			}),
		},
	}))
	return Window
end
