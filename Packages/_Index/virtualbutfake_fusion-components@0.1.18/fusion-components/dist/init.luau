-- this can NOT be good practice, but it's the only way I could get this to work properly w/ wally

-- Base components
local baseIcon = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('icon'))
local baseButton = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('button'))
local baseFrame = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('frame'))
local baseImageLabel = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('imageLabel'))
local baseSinkFrame = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('sinkFrame'))
local baseText = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('text'))
local baseTextBox = require(script:WaitForChild('components'):WaitForChild('base'):WaitForChild('textBox'))
-- Common components

local commonBreadcrumb = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('breadcrumb'))
local commonContextMenu = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('contextMenu'))
local commonMeter = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('meter'))
local commonTabs = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('tabs'))
local commonAlert = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('alert'))
local commonBadge = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('badge'))
local commonButton = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('button'))
local commonCheckbox = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('checkbox'))
local commonColorPicker = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('colorPicker'))
local commonInput = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('input'))
local commonInputMenu = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('inputMenu'))
local commonModal = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('modal'))
local commonPopover = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('popover'))
local commonProgressBar = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('progressBar'))
local commonRange = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('range'))
local commonSelectMenu = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('selectMenu'))
local commonSkeleton = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('skeleton'))
local commonSlider = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('slider'))
local commonTooltip = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('tooltip'))
local commonScrollingFrame = require(script:WaitForChild('components'):WaitForChild('common'):WaitForChild('scrollingFrame'))
-- Utility components

local utilityAwait = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('await'))
local utilityCanvasFrame = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('canvasFrame'))
local utilityHoverLighting = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('hoverLighting'))
local utilityInputCollector = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('inputCollector'))
local utilityMenuEntry = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('menuEntry'))
local utilityPlacementPopover = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('placementPopover'))
local utilityPopover = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('popover'))
local utilityShadow = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('shadow'))
local utilityStoryBase = require(script:WaitForChild('components'):WaitForChild('utility'):WaitForChild('storyBase'))

local index = {
	base = {
		icon = baseIcon,
		button = baseButton,
		frame = baseFrame,
		imageLabel = baseImageLabel,
		sinkFrame = baseSinkFrame,
		text = baseText,
		textBox = baseTextBox,
	},
	common = {
		breadcrumb = commonBreadcrumb,
		contextMenu = commonContextMenu,
		meter = commonMeter,
		tabs = commonTabs,
		alert = commonAlert,
		badge = commonBadge,
		button = commonButton,
		checkbox = commonCheckbox,
		colorPicker = commonColorPicker,
		input = commonInput,
		inputMenu = commonInputMenu,
		modal = commonModal,
		popover = commonPopover,
		progressBar = commonProgressBar,
		range = commonRange,
		selectMenu = commonSelectMenu,
		skeleton = commonSkeleton,
		slider = commonSlider,
		tooltip = commonTooltip,
		scrollingFrame = commonScrollingFrame,
	},
	utility = {
		await = utilityAwait,
		canvasFrame = utilityCanvasFrame,
		hoverLighting = utilityHoverLighting,
		inputCollector = utilityInputCollector,
		menuEntry = utilityMenuEntry,
		placementPopover = utilityPlacementPopover,
		popover = utilityPopover,
		shadow = utilityShadow,
		storyBase = utilityStoryBase,
	},
	theme = require(script:WaitForChild('theme')),
}

return index
