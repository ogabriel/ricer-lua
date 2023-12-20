local setup = require("src.setup")

return {
	hyprland = {
		setups = {
			setup.network,
			setup.thunar,
			setup.hyprland,
		},
	},
}
