-- https://wiki.hypr.land/Configuring/Basics/Variables/#input


hl.config({
  input = {
    kb_layout = "us,ir",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:caps_toggle",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
    accel_profile = "flat",
    repeat_rate = 40,
    repeat_delay = 250,
    numlock_by_default = true,
    touchpad = { natural_scroll = false, clickfinger_behavior = true, scroll_factor = 0.4 },
  },
  misc = { key_press_enables_dpms = true, mouse_move_enables_dpms = true },
})

-- Scroll nicely in the terminal.
o.window("(Alacritty|kitty)", { scroll_touchpad = 1.5 })
-- foot only applies its scrollback multiplier to wheel clicks, not precise touchpad scrolling.
o.window("foot", { scroll_touchpad = 2.0 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })


-- Touchpad gestures.
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.dispatch(hl.dsp.window.fullscreen({ mode = "fullscreen" })) end })
hl.gesture({ fingers = 3, direction = "down", mods = "SUPER", action = function() hl.dispatch(hl.dsp.window.close()) end })
