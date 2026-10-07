hl.monitor({
	output = "DP-3",
	mode = "1920x1080@165",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@74.97",
	position = "1920x0",
	scale = 1,
})

-- 1920x1080@74.97

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = "winboat-.*$" },

	suppress_event = "maximize",
})
hl.window_rule({
	name = "fullscreenmonitor1",
	match = {
		class = "steam_app.*",
	},
	monitor = "DP-3",
	fullscreen = true,
})
hl.window_rule({
	name = "bigpicturefullscreen",
	match = {
		title = "Steam Big Picture Mode",
	},
	fullscreen_state = 3,
	suppress_event = "fullscreen",
	sync_fullscreen = true,
})
hl.window_rule({
	name = "steamdp-3",
	match = {
		class = "steam",
	},
	monitor = "DP-3",
})
hl.layer_rule({
	name = "blur-wofi",
	match = {
		namespace = "wofi",
	},
	blur = true,
	ignore_alpha = 0,
})
hl.layer_rule({
	name = "blur-noctalia",
	match = {
		namespace = "noctalia-background-.*$",
	},
	blur = true,
	ignore_alpha = 0.5,
	blur_popups = true,
})
hl.layer_rule({
	name = "dont animate wallpaper",
	match = {
		namespace = "linux-wallpaperengine",
	},
	no_anim = true,
})

