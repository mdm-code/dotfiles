--  _    _ _____ ___________ ______________  ___
-- | |  | |  ___|___  /_   _|  ___| ___ \  \/  |
-- | |  | | |__    / /  | | | |__ | |_/ / .  . |
-- | |/\| |  __|  / /   | | |  __||    /| |\/| |
-- \  /\  / |___./ /___ | | | |___| |\ \| |  | |
--  \/  \/\____/\_____/ \_/ \____/\_| \_\_|  |_/
--


local wezterm = require("wezterm")


---------------- CONFIGURATION ------------------
local config = wezterm.config_builder()
config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14.0
config.keys = {
	{
		key = "f",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
config.enable_tab_bar = false
-------------------------------------------------

return config
