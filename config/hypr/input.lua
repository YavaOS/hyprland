-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({ ["input.kb_layout"] = "us,ir" })
hl.config({ ["input.kb_variant"] = "" })
hl.config({ ["input.kb_model"] = "" })
hl.config({ ["input.kb_options"] = "grp:caps_toggle" })
hl.config({ ["input.kb_rules"] = "" })
hl.config({ ["input.accel_profile"] = "flat" })

hl.config({ ["input.follow_mouse"] = 1 })

hl.config({ ["input.sensitivity"] = 0 })

hl.config({ ["input.touchpad.natural_scroll"] = false })

hl.config({ ["misc.key_press_enables_dpms"] = true })
hl.config({ ["misc.mouse_move_enables_dpms"] = true })

-- Gestures
hl.gesture({ ["fingers"] = 3, ["direction"] = "horizontal", ["action"] = "workspace" })
hl.gesture({ ["fingers"] = 3, ["direction"] = "up", ["action"] = "fullscreen" })
hl.gesture({ ["fingers"] = 3, ["direction"] = "up", ["action"] = "float", ["mods"] = "SUPER" })
hl.gesture({ ["fingers"] = 3, ["direction"] = "down", ["action"] = "close", ["mods"] = "SUPER" })
