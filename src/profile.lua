local setup = require("src.setup")

local extra = {
	packages = {
		"mako",
		"alacritty",
		"waybar",
		"swaylock",
		"swayidle",
		"rofi-lbonn-wayland",
	},
}

return {
	hyprland = {
		setups = {
			setup.pacman,
			setup.yay,
			setup.sddm,
			setup.audio,
			setup.bluetooth,
			setup.network,
			setup.screen,
			setup.theme,
			setup.fonts,
			setup.thunar,
			setup.hyprland,
			extra,
		},
	},
}
