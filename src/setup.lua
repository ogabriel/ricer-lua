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
			local commands = {
				"modprobe btusb",
				"sudo systemctl enable bluetooth.service",
				"sudo systemctl start bluetooth.service",
			}

			runner.run_commands(commands)
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
			runner.run_command("sudo pacman -R --noconfirm xdg-desktop-portal-gtk xdg-desktop-portal-wlr")
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
			runner.run_command("sudo pacman -R --noconfirm xdg-desktop-portal-gtk xdg-desktop-portal-wlr")
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
			local commands = {
				"sudo systemctl enable NetworkManager.service",
				"sudo systemctl start NetworkManager.service",
			}

			runner.run_commands(commands)
		end,
	},
	pacman = {
		before = function()
			local commands = {

				-- TODO: refactor to check if pacman.conf is already configured
				-- and only run the necessary commands

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
			local commands = {
				"sudo systemctl enable sddm.service",
				"sudo systemctl start sddm.service",
			}

			runner.run_commands(commands)
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
	arch_keyring = {
		before = function()
			runner.run_command("sudo pacman -S --needed --noconfirm archlinux-keyring")
		end,
	},
	arch_utils = {
		packages = {
			"arch-audit-gtk",
		},
	},
	arch_rank_mirrors = {
		before = function()
			local commands = {
				"sudo pacman -S --needed --noconfirm pacman-contrib curl",
				"curl -0 https://archlinux.org/mirrorlist/all/https/ -o /tmp/mirrorlist",
				"sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak",
				"sudo rankmirrors -n 10 /tmp/mirrorlist | sudo tee /etc/pacman.d/mirrorlist",
			}

			runner.run_commands(commands)
		end,
	},
	arch_reflector = {
		before = function()
			local commands = {
				"sudo pacman -S --needed --noconfirm reflector",
				"sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak",
				"sudo reflector --country BR,GB,US, --completion-percent 95 --protocol https --sort rate --download-timeout 60 --fastest 20 --threads 5 --save /etc/pacman.d/mirrorlist",
			}

			runner.run_commands(commands)
		end,
	},
}
