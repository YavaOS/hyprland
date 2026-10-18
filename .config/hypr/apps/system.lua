-- Dialog and utility windows from the base desktop.
o.window("xdg-desktop-portal-gtk", { tag = "+floating-window" })
o.window("org.codeberg.dnkl.foot", { tag = "+floating-window" })
o.window("org.yavaos.about", { float = true, center = true, size = { 920, 480 } })
o.window("omacalc", { float = true })
o.window("org.yavaos.screensaver", { workspace = "special:screensaver silent" })

-- Floating windows
hl.window_rule({ match = { ["tag"] = "floating-window" }, float = true })
hl.window_rule({ match = { ["tag"] = "floating-window" }, center = true })
hl.window_rule({ match = { ["tag"] = "floating-window" }, size = "875 600" })

hl.window_rule({ match = { ["class"] = "(org.yavaos.bluetui|org.yavaos.impala|org.yavaos.wiremix|org.yavaos.btop|org.yavaos.terminal|org.yavaos.bash|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|yavaos|About|TUI.float|imv|mpv)" }, tag = "+floating-window" })
hl.window_rule({ match = { ["class"] = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)", ["title"] = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)" }, tag = "+floating-window" })
hl.window_rule({ match = { ["class"] = "org.gnome.Calculator" }, float = true })

-- Fullscreen screensaver
hl.window_rule({ match = { ["class"] = "org.yavaos.screensaver" }, fullscreen = true })
hl.window_rule({ match = { ["class"] = "org.yavaos.screensaver" }, float = true })
hl.window_rule({ match = { ["class"] = "org.yavaos.screensaver" }, animation = "slide" })

-- No transparency on media windows
hl.window_rule({ match = { ["class"] = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" }, tag = "-default-opacity" })
hl.window_rule({ match = { ["class"] = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" }, opacity = "1 1" })

-- Popped window rounding
hl.window_rule({ match = { ["tag"] = "pop" }, rounding = 8 })

-- Prevent idle while open
hl.window_rule({ match = { ["tag"] = "noidle" }, idle_inhibit = "always" })
