hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("yavaos-launch-shell")
end)

-- Desktop services run in the existing YavaOS shell.
o.launch_on_start("kitty --title kitty-dropdown")
o.launch_on_start("fcitx5 --disable notificationitem")
