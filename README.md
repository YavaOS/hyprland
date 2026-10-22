# YavaOS dotfiles

A home-directory Hyprland and Quickshell desktop with personal rice and a bundled theme collection. The root `.config` and `.local` directories mirror paths under `$HOME`; it runs entirely from user configuration.

## Use

Copy the contents of `.config` and `.local` into the same directories in your home, preserving file permissions. Review files that already exist before replacing them. For example, from a clone:

```sh
cp -a .config/. "$HOME/.config/"
cp -a .local/. "$HOME/.local/"
```

Ensure `$HOME/.local/bin` is in your `PATH`. When launching Hyprland, select `~/.config/hypr/hyprland.lua` as its config. A UWSM session can read `~/.config/uwsm/env`, which sets the required paths. You need Hyprland with Lua config support, Quickshell, and the applications used by your chosen bindings and widgets; optional widgets can be disabled in `~/.config/yavaos/shell.json`.

## Customize

- Edit `~/.config/hypr` for monitors, input, window rules, bindings and autostart.
- Edit `~/.config/yavaos/shell.json` for the bar, launcher and desktop widgets.
- Add themes under `~/.config/yavaos/themes/<name>` and select one with `yavaos-theme-set <name>`. The initial theme is Tokyo Night.
- Edit the menu at `~/.config/yavaos/yavaos-menu.jsonc`.
- Keep your own overrides in the personal configs; shared Hyprland defaults live in `~/.config/hypr/defaults` and theme templates in `~/.config/yavaos/themed`.

The copy commands overwrite matching files. Back up any existing configuration you want to keep before running them.

## Firefox theme

Run `yavaos-firefox-theme-setup` once to connect Firefox profiles to the
generated browser CSS. Firefox loads it on every start without an add-on or
signature. Restart Firefox once to enable `userChrome.css`; after later theme
changes, restart Firefox to pick up the new toolbar, tab, sidebar, and menu
colors.

For live colors without restarting Firefox, install the optional add-on in
`.config/yavaos/firefox-theme/`. It reads the generated
`~/.config/yavaos/current/theme/firefox-theme.json` through the native host
every two seconds and calls Firefox's theme API when it changes. Firefox
release builds require the add-on to be signed for permanent installation;
`about:debugging` can load it temporarily for development. The menu CSS is
separate from the live theme API and still needs a browser restart.
