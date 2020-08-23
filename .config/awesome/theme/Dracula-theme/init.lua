local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Ubuntu Medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.indigo
theme.primary.hue_500 = '#ff5555'
-- Accent
theme.accent = mat_colors.purple

-- Background
theme.background = mat_colors.blue_grey

theme.background.hue_800 = '#282a36' -- color for left & top panel
theme.background.hue_900 = '#6272a4' -- color for action bar

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
