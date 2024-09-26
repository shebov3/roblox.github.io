local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
local new = Fusion.New
local Children = Fusion.Children

return function(props)
    props.Padding = props.Padding or UDim.new(0, 15)
    return Fusion.New("Frame")({
        Visible = props.Visible,
        BackgroundTransparency = 1,

        Position = UDim2.fromOffset(0, 50),
        Size = UDim2.new(1, 0, 1, -100),
        [Children] = {
            new("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = props.Padding,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            props.Children
        },
    })
end