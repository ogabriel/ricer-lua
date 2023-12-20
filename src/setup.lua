return {
	network = {
		packages = { "networkmanager", "network-manager-applet", "libappindicator-gtk3" },
		after = function()
			os.execute("sudo systemctl enable NetworkManager.service")
			os.execute("sudo systemctl start NetworkManager.service")
		end,
	},
	thunar = {
		packages = { "thunar", "tumbler" },
	},
	hyprland = {
		packages = { "hyprland" },
	},
	amd = {
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
}
