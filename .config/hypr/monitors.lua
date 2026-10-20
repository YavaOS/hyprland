-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local yavaos_gdk_scale = 1
local yavaos_monitor_scale = 1
local mirror = false

hl.env("GDK_SCALE", tostring(yavaos_gdk_scale))

-- Monitors
if mirror then
	hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = yavaos_monitor_scale })
	hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = yavaos_monitor_scale, mirror = "eDP-1" })
else
	hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = yavaos_monitor_scale })
	hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "1920x0", scale = yavaos_monitor_scale })
end

for i = 1, 9 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = mirror and "eDP-1" or "HDMI-A-1",
		persistent = true,
	})
end

hl.workspace_rule({ workspace = "10", monitor = "eDP-1", persistent = true })
