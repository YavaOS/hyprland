-- Theme packages still ship hyprlang; prefer a Lua theme when available.
local theme = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config")
    .. "/yavaos/current/theme/hyprland"
local file = io.open(theme .. ".lua", "r")
if file then
    file:close()
    dofile(theme .. ".lua")
else
    local legacy = io.open(theme .. ".conf", "r")
    if not legacy then return end
    local content = legacy:read("*a")
    legacy:close()
    local color = assert(content:match("%$activeBorderColor%s*=%s*([^\n]+)"),
        "Theme has no activeBorderColor")
    hl.config({
        ["general.col.active_border"] = color,
        ["group.col.border_active"] = color,
    })
    -- Preserve the terminal opacity override supplied by Kanagawa.
    for opacity, tag in content:gmatch("windowrule%s*=%s*opacity%s+([^,]+),%s*match:tag%s+([^%s]+)") do
        hl.window_rule({ match = { tag = tag }, opacity = opacity })
    end
end
