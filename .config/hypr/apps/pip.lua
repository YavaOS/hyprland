-- Google Meet PiP uses the meeting title instead of "Picture-in-Picture".
o.window({ tag = "chromium-based-browser", title = "^Meet - .+" }, {
  float = true,
  pin = true,
  size = { 600, 338 },
  keep_aspect_ratio = true,
  border_size = 0,
  move = { "(monitor_w-window_w-40)", "(monitor_h-window_h-40)" },
})


-- Picture-in-picture overlays
hl.window_rule({ match = { ["title"] = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
hl.window_rule({ match = { ["tag"] = "pip" }, tag = "-default-opacity" })
hl.window_rule({ match = { ["tag"] = "pip" }, float = true })
hl.window_rule({ match = { ["tag"] = "pip" }, pin = true })
hl.window_rule({ match = { ["tag"] = "pip" }, size = "600 338" })
hl.window_rule({ match = { ["tag"] = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ match = { ["tag"] = "pip" }, border_size = 0 })
hl.window_rule({ match = { ["tag"] = "pip" }, opacity = "1 1" })
hl.window_rule({ match = { ["tag"] = "pip" }, move = "(monitor_w-window_w-40) (monitor_h*0.04)" })
