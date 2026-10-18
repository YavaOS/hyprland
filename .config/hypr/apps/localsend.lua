-- Float LocalSend and fzf file picker.
local localsend = "(org\\.localsend\\.)?localsend(_app)?"
o.window("Share", { float = true, center = true })
o.window(localsend, { float = true, center = true, size = { 1100, 700 } })
o.transparent_window(localsend)

-- Float LocalSend and fzf file picker
hl.window_rule({ match = { ["class"] = "(Share|localsend)" }, float = true })
hl.window_rule({ match = { ["class"] = "(Share|localsend)" }, center = true })
hl.window_rule({ match = { ["class"] = "localsend" }, size = "1100 700" })
