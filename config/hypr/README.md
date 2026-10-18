Hyprland loads `hyprland.lua` on 0.55 and later. It imports the Lua modules
in this directory, including app rules and keybindings. If your session launcher
passes `--config hyprland.conf`, change that argument to `hyprland.lua`.

The original Hyprland `.conf` files are retained for rollback and older YavaOS
tools that read them; edit the `.lua` files for the new configuration.
Hypridle, Hyprpaper, Hyprsunset and portal configuration keep their own syntax.

`theme.lua` prefers the current theme's `hyprland.lua`. For existing theme
packages, it reads the border color and tagged opacity overrides from
`hyprland.conf`. Convert any additional theme directives to Lua before using them.
The HyprEmoji integration is now in `apps/hypremoji.lua`.

Validate without starting or reloading the desktop:

```sh
Hyprland --verify-config -c ~/.config/hypr/hyprland.lua
```

External `yavaos-*` helper scripts still contain legacy `hyprctl dispatch` and
`hyprctl keyword` commands. Those scripts need a separate migration for full Lua
runtime compatibility (including window pop, gap toggles and monitor scaling).
