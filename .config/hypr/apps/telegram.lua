o.window("^org\\.telegram\\.desktop", { float = true, size = { 1024, 768 }, focus_on_activate = false })
hl.window_rule({ match = { ["class"] = "org.telegram.desktop" }, opacity = "0.9" })
