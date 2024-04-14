local runner = require("src.runner")

return {
	amdmicrocode = {
		packages = {
			"amd-ucode",
		},
	},
	intelmicrocode = {
		packages = {
			"intel-ucode",
		},
	},
	amdgpu = {
		packages = {
			"mesa",
			--32bit
			"lib32-mesa",
			--ddx
			"xf86-video-amdgpu",
			--vulkan
			"vulkan-radeon",
			--HW video decoding
			"libva-mesa-driver",
			"lib32-libva-mesa-driver",
			"mesa-vdpau",
			"lib32-mesa-vdpau",
			--utils HW
			"libva-utils",
		},
	},
	audio = {
		packages = {
			"pipewire",
			"pipewire-alsa",
			"pipewire-pulse",
			"libpulse",
			"pipewire-audio",
			"pipewire-jack",
			"gst-plugin-pipewire",
			"libpipewire",
			"wireplumber",
			"libwireplumber",
			"pavucontrol",
			"playerctl",
		},
	},
	bluetooth = {
		packages = {
			"bluez",
			"bluez-utils",
			"bluez-libs",
			"blueman",
			"libappindicator-gtk3",
		},
		after = function()
			os.execute("modprobe btusb")
			os.execute("sudo systemctl enable bluetooth.service")
			os.execute("sudo systemctl start bluetooth.service")
		end,
	},
	fonts = {
		packages = {
			"noto-fonts-emoji",
			"nerd-fonts-git",
		},
	},
	gnome = {
		packages = {
			"gnome-calculator",
			"gnome-keyring",
			"gnome-system-monitor",
			"polkit-gnome",
		},
	},
	hyprland = {
		before = function()
			os.execute("sudo pacman -R --noconfirm xdg-desktop-portal-gtk xdg-desktop-portal-wlr")
		end,
		packages = {
			"hyprland",
			"qt5-wayland",
			"qt6-wayland",
			"xdg-desktop-portal",
			"xdg-desktop-portal-hyprland",
		},
	},
	hyprland_git = {
		before = function()
			os.execute("sudo pacman -R --noconfirm xdg-desktop-portal-gtk xdg-desktop-portal-wlr")
		end,
		packages = {
			"hyprland-git",
			"qt5-wayland",
			"qt6-wayland",
			"xdg-desktop-portal",
			"xdg-desktop-portal-hyprland-git",
		},
	},
	network = {
		packages = {
			"networkmanager",
			"network-manager-applet",
			"libappindicator-gtk3",
		},
		after = function()
			os.execute("sudo systemctl enable NetworkManager.service")
			os.execute("sudo systemctl start NetworkManager.service")
		end,
	},
	pacman = {
		before = function()
			local commands = {
				"sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf",
				"sudo sed -i 's/#Color/Color\nILoveCandy/' /etc/pacman.conf",
			}

			runner.run_commands(commands)
		end,
	},
	screen = {
		packages = {
			"gammastep",
			"brightnessctl",
			"grim",
			"slurp",
			"flameshot-git",
		},
	},
	sddm = {
		packages = {
			"sddm",
		},
		after = function()
			os.execute("sudo systemctl enable sddm.service")
			os.execute("sudo systemctl start sddm.service")
		end,
	},
	theme = {
		packages = {
			"wpgtk",
			"python-pywal",
		},
	},
	thunar = {
		packages = {
			"thunar",
			"tumbler",
		},
	},
	yay = {
		before = function()
			local commands = {
				"sudo pacman -S --needed --noconfirm git base-devel",
				"cd /tmp",
				"git clone https://aur.archlinux.org/yay-bin.git",
				"cd yay-bin",
				"makepkg -si --noconfirm",
			}

			runner.run_commands(commands)
		end,
	},
}
