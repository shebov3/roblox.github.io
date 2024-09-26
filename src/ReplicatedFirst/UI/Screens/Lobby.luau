local Components = game.ReplicatedFirst.UI.Components
local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Lydie = require(Packages.Lydie)
local Container = require(Components.Container)
local Window = require(Components.Window)
local warp, event = nil, setmetatable({}, { __call = function() end })

local runservice = game:GetService("RunService")
local Running = runservice:IsRunning()
if Running then
	warp = require(Packages.warp)
	event = warp.Client("CreateRoom")
end

local Frame = require(Components.Frame)
local Toggle = require(Components.Toggle)
local Slider = require(Components.Slider)
local TextLabel = require(Components.TextLabel)
local Controls = Lydie.Components.Controls
local Button = Controls.TextButton
local app = Controls.AppTabBarButton
local Icons = Lydie.Components.Controls.Icons.icons

return function(props: table)
	props.AspectRatio = Fusion.Value(1.75)
	props.Title = Fusion.Value("Something important")
	props.Subtitle = Fusion.Value("Something important too")
	props.Visible = props.Visible or Fusion.Value(false)
	props.Events = props.Events or {}
	local visible = Fusion.Value(true)

	props.Frames = {
		Frame({
			Padding = UDim.new(0, 10),
			Name = "Unique1",
			Visible = visible,
			Children = {
				Container({
					Padding = UDim.new(0, 150),
					Children = {
						TextLabel({ Text = "Room Capacity: ", AnchorPoint = Vector2.new(0.5, 0.5) }),
						Slider({
							Width = 200,
							Value = Fusion.Value(4),
							Stepper = Fusion.Value(100),
							Min = Fusion.Value(2),
							Max = Fusion.Value(4),
						}),
					},
				}),
				Container({
					Padding = UDim.new(0, 150),
					Children = {
						TextLabel({ Text = "Friends Only: ", AnchorPoint = Vector2.new(0.5, 0.5) }),
						Toggle({}),
					},
				}),
				Container({
					Children = {
						Button({
							Text = "Create",
							OnClick = function()
								event:Fire()
							end,
						}),
					},
				}),
			},
		}),
		Frame({
			Visible = Fusion.Computed(function()
				return not visible:get()
			end),
			Children = {
				Container({
					Children = {
						Button({
							Text = "Cool",
						}),
						Button({
							Text = "Cool",
						}),
					},
				}),
			},
		}),
	}
	props.apps = {
		app({
			Icon = Icons.pencil,
			State = visible,
			OnClick = function()
				visible:set(true)
			end,
		}),
		app({
			Icon = Icons.search,
			State = Fusion.Computed(function()
				return not visible:get()
			end),
			OnClick = function()
				visible:set(false)
			end,
		}),
	}
	return Window(props)
end
