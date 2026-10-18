-- DaVinci Resolve window focus handling.
o.window(".*[Rr]esolve.*", {
  float = true,
  -- Prevent modal dialog pointer warps when focus follows the mouse.
  no_follow_mouse = true,
})

o.window({ class = ".*[Rr]esolve.*", title = "^DaVinci Resolve( Studio)? - .+$" }, { fullscreen = true })
-- Resolve exposes the Voiceover panel under the generic "Dialog" title.
o.window({ class = ".*[Rr]esolve.*", title = "^(DaVinci Resolve( Studio)? - .+|Project Manager|Preferences|Find Directory|Dialog)$" }, { stay_focused = false })

-- Focus floating DaVinci Resolve dialog windows
hl.window_rule({ match = { ["class"] = ".*[Rr]esolve.*", ["float"] = true }, stay_focused = true })
