local Components = game.ReplicatedFirst.UI.Components
local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)
local Lydie = require(Packages.Lydie)
local Container = require(Components.Container)
local Window = require(Components.Window)
local warp = nil

local function EmptyMeta(count)
	count = count or 1
	local Tuple = {}
	for _=1,count do
		table.insert(Tuple, setmetatable({}, { __call = function() end }))
	end
	return table.unpack(Tuple)
end

local CreateRoomEvent = EmptyMeta()

local runservice = game:GetService("RunService")
local Running = runservice:IsRunning()
if Running then
	warp = require(Packages.warp)
	CreateRoomEvent = warp.Client("CreateRoom")
end

local Frame = require(Components.Frame)
local Toggle = require(Components.Toggle)
local Slider = require(Components.Slider)
local Card = require(Components.Card)
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
	local hosting = Fusion.Value(true)
	local sliderValue = Fusion.Value(4)
	local PlayersCapacity = 4
	local stateValue = false
	Fusion.Observer(sliderValue):onChange(function()
		PlayersCapacity = (sliderValue:get() * 2) + 2
	end)
	props.Frames = {
		Frame({
			Padding = UDim.new(0.1, 0),
			Visible = Fusion.Computed(function()
				return visible:get() and not hosting:get()
			end),
			Children = {
				Container({
					Padding = UDim.new(0.2, 0),
					Children = {
						TextLabel({ Text = "Room Capacity: ", AnchorPoint = Vector2.new(0.5, 0.5) }),
						Slider({
							Width = 100,
							Value = sliderValue,
							Stepper = Fusion.Value(100),
							Min = Fusion.Value(2),
							Max = Fusion.Value(4),
						}),
					},
				}),
				Container({
					Padding = UDim.new(0.2, 0),
					Children = {
						TextLabel({ Text = "Friends Only: ", AnchorPoint = Vector2.new(0.5, 0.5) }),
						Toggle({
							OnClick = function(state)
								stateValue = not state:get()
								state:set(stateValue)
							end,
						}),
					},
				}),
				Container({
					Children = {
						Button({
							Text = "Create",
							OnClick = function()
								CreateRoomEvent:Fire(true, PlayersCapacity, stateValue)
							end,
						}),
					},
				}),
			},
		}),
		-- Host
		Frame({
			Padding = UDim.new(0, 10),
			Visible = Fusion.Computed(function()
				return visible:get() and hosting:get()
			end),
			Children = {
				Card({ Text = "shebov3" }),
				Button({ Text = "Start" }),
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
