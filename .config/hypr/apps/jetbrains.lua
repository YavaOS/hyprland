-- Disable mouse focus (see https://github.com/omacom/yavaos/pull/5183#issuecomment-4189299971).
o.window("^(jetbrains-.*)$", { no_follow_mouse = true })

-- Fix splash screen placement and prevent focus takeovers.
o.window({ class = "^(jetbrains-.*)$", title = "^(splash)$", float = true }, {
	tag = "+jetbrains-splash",
	center = true,
	no_focus = true,
	border_size = 0,
})

-- Center popups/find windows (stay_focused makes popups accept input).
o.window({ class = "^(jetbrains-.*)$", title = "^(| )$", float = true }, {
	center = true,
	stay_focused = true,
	border_size = 0,
	min_size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
})

-- Disable window flicker when autocomplete or tooltips appear.
o.window({ class = "^(jetbrains-.*)$", title = "^(win.*)$", float = true }, {
	no_initial_focus = true,
})
