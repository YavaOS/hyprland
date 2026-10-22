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

-- Keep grouped tabs in the same tinted glass palette as the shell bar.
local palette = io.open(theme:gsub("/hyprland$", "/colors.toml"), "r")
if palette then
    local colors = palette:read("*a")
    palette:close()
    local function hex(name)
        return colors:match("\n" .. name .. '%s*=%s*"#(%x%x%x%x%x%x)"')
            or colors:match("^" .. name .. '%s*=%s*"#(%x%x%x%x%x%x)"')
    end
    local accent, background, foreground = hex("accent"), hex("background"), hex("foreground")
    if accent and background then
        local function tint(base, highlight)
            local channels = {}
            for i = 1, 5, 2 do
                local a = tonumber(base:sub(i, i + 1), 16)
                local b = tonumber(highlight:sub(i, i + 1), 16)
                channels[#channels + 1] = string.format("%02x", math.floor(a * 0.85 + b * 0.15 + 0.5))
            end
            return table.concat(channels)
        end
        hl.config({ group = { groupbar = {
            col = {
                active = "rgba(" .. tint(background, accent) .. "b8)",
                inactive = "rgba(" .. background .. "90)",
            },
            text_color = foreground and "rgb(" .. foreground .. ")" or "rgb(ffffff)",
            text_color_inactive = foreground and "rgba(" .. foreground .. "a0)" or "rgba(ffffff90)",
        } } })
    end
end
