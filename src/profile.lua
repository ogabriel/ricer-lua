local setup = require("src.setup")
local runner = require("src.runner")

return {
	hyprland = {
		name = "Hyprland",
		setups = {
			{
				before = function()
					runner.run_command("sudo pacman -Syy")
				end,
			},
			setup.arch_keyring,
			setup.yay,
			setup.arch_reflector,
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
            setup.gnome,
			setup.hyprland,
			{
				packages = {
					"swaync",
					"alacritty",
					"waybar",
					"swaylock",
					"swayidle",
					"rofi-wayland",
                    "swww",
					"firefox",
                    "htop",
                    "fastfetch",
				},
			},
		},
	},
}
