-- Fix splash screen showing in weird places and prevent annoying focus takeovers
hl.window_rule({ match = { ["class"] = "^(jetbrains-.*)$", ["title"] = "^(splash)$", ["float"] = true }, name = "jetbrains-splash", tag = "+jetbrains-splash", center = true, no_focus = true, border_size = 0 })

-- Center popups/find windows
-- Enabling this makes it possible to provide input in popup dialogs (search window, new file, etc.)
hl.window_rule({ match = { ["class"] = "^(jetbrains-.*)", ["title"] = "^(| )$", ["float"] = true }, name = "jetbrains-popup", tag = "+jetbrains", center = true, stay_focused = true, border_size = 0, min_size = "(monitor_w*0.5) (monitor_h*0.5)" })

-- Disable window flicker when autocomplete or tooltips appear
hl.window_rule({ match = { ["class"] = "^(jetbrains-.*)$", ["title"] = "^(win.*)$", ["float"] = true }, name = "jetbrains-tooltip", no_initial_focus = true })

-- Disable mouse focus
hl.window_rule({ match = { ["class"] = "^(jetbrains-.*)$" }, name = "jetbrains-focus", no_follow_mouse = true })
