-- Browser types
hl.window_rule({ match = { ["class"] = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" }, tag = "+chromium-based-browser" })
hl.window_rule({ match = { ["class"] = "([fF]irefox|zen|librewolf)" }, tag = "+firefox-based-browser" })
hl.window_rule({ match = { ["tag"] = "chromium-based-browser" }, tag = "-default-opacity" })
hl.window_rule({ match = { ["tag"] = "firefox-based-browser" }, tag = "-default-opacity" })

-- Video apps: remove chromium browser tag so they don't get opacity applied
hl.window_rule({ match = { ["class"] = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" }, tag = "-chromium-based-browser" })
hl.window_rule({ match = { ["class"] = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" }, tag = "-default-opacity" })

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({ match = { ["tag"] = "chromium-based-browser" }, tile = true })

-- Keep browser pages fully opaque; window opacity also fades their content.
hl.window_rule({ match = { ["tag"] = "chromium-based-browser" }, opacity = "1.0 1.0" })
hl.window_rule({ match = { ["tag"] = "firefox-based-browser" }, opacity = "1.0 0.97" })

-- Video app classes from the base desktop.
o.window("(^.+-youtube\\.com__.*$|^.+-app\\.zoom\\.us__wc_home.*$)", { tag = "-chromium-based-browser" })

-- Hide screen sharing notification windows.
o.window({ title = ".*is sharing.*" }, { workspace = "special silent" })
