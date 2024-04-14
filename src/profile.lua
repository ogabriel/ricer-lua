local setup = require("src.setup")

return {
	arch_hyprland_amd = {
		setups = {
			{
				before = function()
					runner.run("sudo pacman -Syy")
				end,
			},
			setup.arch_keyring,
			setup.yay,
			setup.arch_utils,
			setup.amdmicrocode,
			setup.amdgpu,
			setup.sddm,
			setup.audio,
			setup.bluetooth,
			setup.network,
			setup.screen,
			setup.theme,
			setup.fonts,
			setup.thunar,
			setup.hyprland,
			{
				packages = {
					"swaync",
					"alacritty",
					"waybar",
					"swaylock",
					"swayidle",
					"rofi-lbonn-wayland",
					"firefox",
				},
			},
		},
	},
}
