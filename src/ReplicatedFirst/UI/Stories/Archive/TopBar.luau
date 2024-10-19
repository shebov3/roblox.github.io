local replicatedStorage = game:GetService("ReplicatedStorage")
local Packages = replicatedStorage:WaitForChild("Packages")

local Fusion = require(Packages.Fusion)
local new = Fusion.New
local Children = Fusion.Children
local Lydie = require(Packages.Lydie)
local Components = Lydie.Components
local Views = Components.Views
local topBar = Views.TopAppBar
local appBar = Components.Controls.AppBarButton
local Icons = Lydie.Modules.Icons

return function(props)
    return topBar({
        Icon = Icons.info,
        Title = props.Title,
        Subtitle = props.Subtitle,
        [Children] = {
            new("UIPadding")({
                PaddingRight = UDim.new(0, 5),
            }),

            appBar({
                Icon = Icons["x-circle"],
                LayoutOrder = 2,
                OnClick = function()
                    props.Visible:set(false)
                end,
            }),
        },
    })
end