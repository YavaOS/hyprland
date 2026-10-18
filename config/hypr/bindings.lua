require("bindings.media")
require("bindings.clipboard")
require("bindings.tiling")
require("bindings.utilities")

-- Application bindings
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"), { ["description"] = "Terminal" })
hl.bind(
	"SUPER + ALT + RETURN",
	hl.dsp.exec_cmd(
		'uwsm-app -- xdg-terminal-exec --dir="$(yavaos-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"'
	),
	{ ["description"] = "Tmux" }
)
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("yavaos-launch-browser"), { ["description"] = "Browser" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"), { ["description"] = "File manager" })
hl.bind(
	"SUPER + ALT + SHIFT + F",
	hl.dsp.exec_cmd('uwsm-app -- nautilus --new-window "$(yavaos-cmd-terminal-cwd)"'),
	{ ["description"] = "File manager (cwd)" }
)
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("yavaos-launch-browser"), { ["description"] = "Browser" })
hl.bind(
	"SUPER + SHIFT + ALT + B",
	hl.dsp.exec_cmd("yavaos-launch-browser --private"),
	{ ["description"] = "Browser (private)" }
)
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("yavaos-launch-or-focus spotify"), { ["description"] = "Music" })
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("yavaos-launch-editor"), { ["description"] = "Editor" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("yavaos-launch-tui lazydocker"), { ["description"] = "Docker" })
hl.bind(
	"SUPER + SHIFT + G",
	hl.dsp.exec_cmd('yavaos-launch-or-focus ^signal$ "uwsm-app -- signal-desktop"'),
	{ ["description"] = "Signal" }
)
hl.bind(
	"SUPER + SHIFT + O",
	hl.dsp.exec_cmd('yavaos-launch-or-focus ^obsidian$ "uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"'),
	{ ["description"] = "Obsidian" }
)
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("uwsm-app -- typora --enable-wayland-ime"), { ["description"] = "Typora" })
hl.bind("SUPER + SHIFT + SLASH", hl.dsp.exec_cmd("uwsm-app -- bitwarden"), { ["description"] = "Passwords" })

-- If your web app url contains #, type it as ## to prevent hyprland treating it as a comment
hl.bind(
	"SUPER + SHIFT + A",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://chatgpt.com"'),
	{ ["description"] = "ChatGPT" }
)
hl.bind(
	"SUPER + SHIFT + ALT + A",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://grok.com"'),
	{ ["description"] = "Grok" }
)
hl.bind(
	"SUPER + SHIFT + C",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://calendar.google.com"'),
	{ ["description"] = "Calendar" }
)
hl.bind(
	"SUPER + SHIFT + E",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://mail.google.com"'),
	{ ["description"] = "Email" }
)
hl.bind(
	"SUPER + SHIFT + Y",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://youtube.com/"'),
	{ ["description"] = "YouTube" }
)
hl.bind(
	"SUPER + SHIFT + ALT + G",
	hl.dsp.exec_cmd('yavaos-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"'),
	{ ["description"] = "WhatsApp" }
)
hl.bind(
	"SUPER + SHIFT + CTRL + G",
	hl.dsp.exec_cmd('yavaos-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"'),
	{ ["description"] = "Google Messages" }
)
hl.bind(
	"SUPER + SHIFT + P",
	hl.dsp.exec_cmd('yavaos-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"'),
	{ ["description"] = "Google Photos" }
)
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd('yavaos-launch-webapp "https://x.com/"'), { ["description"] = "X" })
hl.bind(
	"SUPER + SHIFT + ALT + X",
	hl.dsp.exec_cmd('yavaos-launch-webapp "https://x.com/compose/post"'),
	{ ["description"] = "X Post" }
)

-- Add extra bindings
-- bind = SUPER SHIFT, R, exec, alacritty -e ssh your-server
hl.bind(
	"CTRL + grave",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ ["description"] = "Toggle Mic Mute" }
)

-- Overwrite existing bindings, like putting yavaos Menu on Super + Space
-- unbind = SUPER, SPACE
-- bindd = SUPER, SPACE, yavaos menu, exec, yavaos-menu
