local fusion = require(script.Parent.Parent.Parent.Parent:WaitForChild('fusion'))
local Hydrate = fusion.Hydrate

local lucide = require(script.Parent.Parent.Parent.Parent:WaitForChild('Lucide'))
local fusionUtils = require(script.Parent.Parent.Parent.Parent:WaitForChild('fusionUtils'))
local propertyProvider = fusionUtils.propertyProvider

local theme = require(script.Parent.Parent.Parent:WaitForChild('theme'))

local baseImage = require(script.Parent:WaitForChild('imageLabel'))
local lucideIcon = require(script:WaitForChild('lucideIcon'))

export type icon = {
	Name: string,
	Size: number
}

type props = {
	Icon: string | icon,
	Color: fusion.CanBeState<theme.color>?
}

local function icon(props: props): ImageLabel
	local convertedIcon: icon = (
		typeof(props.Icon) == "string" and {
			Name = props.Icon,
			Size = 16,
		} or props.Icon
	) :: icon

	if convertedIcon == nil then
		error("Provided icon was nil")
	end

	if typeof(convertedIcon.Size) == "number" then
		local asset = lucide.GetAsset(convertedIcon.Name, convertedIcon.Size)

		if asset then
			local component = lucideIcon({
				IconName = convertedIcon.Name,
				IconSize = convertedIcon.Size,
				Color = props.Color,
			})

			return Hydrate(component)(propertyProvider.getPropsAndSpecialKeys(props, "ImageLabel")) :: ImageLabel
		end
	end

	local component = baseImage({
		Appearance = {
			color = Color3.fromRGB(255, 255, 255),
			transparency = 0,
		},
		Image = convertedIcon.Name,
		BackgroundTransparency = 1,
		Size = typeof(convertedIcon.Size) == "UDim2" and convertedIcon.Size
			or UDim2.new(0, convertedIcon.Size :: number, 0, convertedIcon.Size :: number),
	})

	return Hydrate(component)(propertyProvider.getPropsAndSpecialKeys(props, "ImageLabel")) :: ImageLabel
end

return icon
