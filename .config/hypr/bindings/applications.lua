-- Essential application bindings.
o.bind("SUPER + RETURN", "Terminal", o.launch_terminal())
o.bind("SUPER + SHIFT + RETURN", "Browser", { yavaos = "browser" })
o.bind("SUPER + SHIFT + F", "File manager", { yavaos = "nautilus" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { yavaos = "nautilus-cwd" })
o.bind("SUPER + SHIFT + B", "Browser", { yavaos = "browser" })
o.bind("SUPER + SHIFT + ALT + B", "Browser (private)", { yavaos = "browser --private" })
o.bind("SUPER + SHIFT + N", "Editor", { yavaos = "editor" })

if o.preinstalled_bindings_enabled() then
  -- Bindings for preinstalled YavaOS applications, TUIs, and web apps.
  o.bind("SUPER + ALT + RETURN", "Tmux", { yavaos = "terminal-tmux" })
  o.bind("SUPER + CTRL + RETURN", "Herdr", { yavaos = "terminal-herdr" })
  o.bind("SUPER + SHIFT + M", "Music", { yavaos = "spotify" })
  o.bind("SUPER + SHIFT + ALT + M", "Music TUI", { tui = "cliamp", focus = true })
  if o.cmd_present("lazydocker") then
    o.bind("SUPER + SHIFT + D", "Docker", { tui = "yavaos-launch-docker-tui" })
  end
  o.bind("SUPER + SHIFT + G", "Signal", { yavaos = "signal" })
  o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
  o.bind("SUPER + SHIFT + SLASH", "Passwords", { yavaos = "1password" })

  o.bind("SUPER + SHIFT + A", "ChatGPT", { webapp = "https://chatgpt.com" })
  o.bind("SUPER + SHIFT + ALT + A", "Grok", { webapp = "https://grok.com" })
  o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })
  o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://app.hey.com" })
  o.bind("SUPER + SHIFT + ALT + E", "New email", { webapp = "https://app.hey.com/messages/new?display=standalone&new_window=true" })
  o.bind("SUPER + SHIFT + Y", "YouTube", { webapp = "https://youtube.com/" })
  o.bind("SUPER + SHIFT + ALT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
  o.bind( "SUPER + SHIFT + CTRL + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
  o.bind("SUPER + SHIFT + P", "Google Photos", { webapp = "https://photos.google.com/", focus = true })
  o.bind("SUPER + SHIFT + ALT + S", "Google Maps", { webapp = "https://maps.google.com/", focus = true })
  o.bind("SUPER + SHIFT + X", "X", { webapp = "https://x.com/" })
  o.bind("SUPER + SHIFT + ALT + X", "X Post", { webapp = "https://x.com/compose/post" })
end
