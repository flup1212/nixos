hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgb(f1a8ff)", "rgb(f1a8ff)"}, angle = 45 },
            inactive_border = "rgba(00000000)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling",
    },

    layout = {
		single_window_aspect_ratio = { 16, 9 },
    },

    dwindle = {
        force_split                  = 0,
        preserve_split               = true,
        smart_split                  = true,
        smart_resizing               = true,
        permanent_direction_override = false,
        special_scale_factor         = 1,
        split_width_multiplier       = 1.0,
        use_active_for_splits        = true,
        default_split_ratio          = 1.0,
        split_bias                   = 0,
        precise_mouse_move           = false,
    },

    scrolling = {
	wrap_focus = false,
	wrap_swapcol = false,
    },

    decoration = {
        rounding       = 0,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1,
        inactive_opacity = 0.5,

        shadow = {
            enabled        = false,
            range          = 5,
            render_power   = 4,
	        sharp          = false,
            color          = "rgba(e3fffd40)",
	        color_inactive = "rgba(00000000)",
	        offset         = { 0, 0 },
	        scale          = 1.0
        },

	    glow = {
            enabled        = false,
            range          = 5,
            render_power   = 2,
            color          = "rgba(e3fffd40)",
            color_inactive = "rgba(00000000)",
	    },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper      = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo        = true, -- If true disables the random hyprland logo / anime girl background. :(
        animate_mouse_windowdragging = true,
        animate_manual_resizes       = true,
	on_focus_under_fullscreen = 1,
    },
})

-- Default curves and animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.curve("looseSpring",    { type = "spring", mass = 1, stiffness = 100,     dampening = 15.4         })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 10,   spring = "looseSpring",  style = "" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 10,   spring = "looseSpring",  style = "popin 70%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 4,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 10,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = false, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 2, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 11,   bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Window rules

-- Layer rules
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "noctalia",
  },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
