-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- Variables

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({ ["general.gaps_in"] = 2 })
hl.config({ ["general.gaps_out"] = 4 })

hl.config({ ["general.border_size"] = 1 })

-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
hl.config({ ["general.col.active_border"] = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 } })
hl.config({ ["general.col.inactive_border"] = "rgba(595959aa)" })

-- Set to true enable resizing windows by clicking and dragging on borders and gaps
hl.config({ ["general.resize_on_border"] = true })

-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
hl.config({ ["general.allow_tearing"] = false })

hl.config({ ["general.layout"] = "dwindle" })

-- https://wiki.hyprland.org/Configuring/Variables/#decoration
hl.config({ ["decoration.rounding"] = 3 })

hl.config({ ["decoration.shadow.enabled"] = true })
hl.config({ ["decoration.shadow.range"] = 2 })
hl.config({ ["decoration.shadow.render_power"] = 3 })
hl.config({ ["decoration.shadow.color"] = "rgba(1a1a1aee)" })

-- https://wiki.hyprland.org/Configuring/Variables/#blur
hl.config({ ["decoration.blur.enabled"] = true })
hl.config({ ["decoration.blur.size"] = 2 })
hl.config({ ["decoration.blur.passes"] = 2 })
hl.config({ ["decoration.blur.special"] = true })
hl.config({ ["decoration.blur.brightness"] = 0.60 })
hl.config({ ["decoration.blur.contrast"] = 0.75 })

-- https://wiki.hypr.land/Configuring/Variables/#group
hl.config({ ["group.col.border_active"] = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 } })
hl.config({ ["group.col.border_inactive"] = "rgba(595959aa)" })
hl.config({ ["group.col.border_locked_active"] = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 } })
hl.config({ ["group.col.border_locked_inactive"] = "rgba(595959aa)" })

hl.config({ ["group.groupbar.font_size"] = 12 })
hl.config({ ["group.groupbar.font_family"] = "monospace" })
hl.config({ ["group.groupbar.font_weight_active"] = "ultraheavy" })
hl.config({ ["group.groupbar.font_weight_inactive"] = "normal" })

hl.config({ ["group.groupbar.indicator_height"] = 0 })
hl.config({ ["group.groupbar.indicator_gap"] = 5 })
hl.config({ ["group.groupbar.height"] = 22 })
hl.config({ ["group.groupbar.gaps_in"] = 5 })
hl.config({ ["group.groupbar.gaps_out"] = 0 })

hl.config({ ["group.groupbar.text_color"] = "rgb(ffffff)" })
hl.config({ ["group.groupbar.text_color_inactive"] = "rgba(ffffff90)" })
hl.config({ ["group.groupbar.col.active"] = "rgba(00000040)" })
hl.config({ ["group.groupbar.col.inactive"] = "rgba(00000020)" })

hl.config({ ["group.groupbar.gradients"] = true })
hl.config({ ["group.groupbar.gradient_rounding"] = 0 })
hl.config({ ["group.groupbar.gradient_round_only_edges"] = false })


-- https://wiki.hyprland.org/Configuring/Variables/#animations
hl.config({ ["animations.enabled"] = true })

-- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "quick", style = "fade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "quick", style = "fade" })

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({ ["dwindle.preserve_split"] = true })
hl.config({ ["dwindle.force_split"] = 2 })

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
hl.config({ ["master.new_status"] = "master" })

-- https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({ ["misc.disable_hyprland_logo"] = true })
hl.config({ ["misc.disable_splash_rendering"] = true })
hl.config({ ["misc.focus_on_activate"] = true })
hl.config({ ["misc.anr_missed_pings"] = 3 })
hl.config({ ["misc.on_focus_under_fullscreen"] = 1 })

-- https://wiki.hypr.land/Configuring/Variables/#cursor
hl.config({ ["cursor.hide_on_key_press"] = true })
hl.config({ ["cursor.warp_on_change_workspace"] = 1 })

-- Auto toggle scratchpad on switching workspace from scratchpad
hl.config({ ["binds.hide_special_on_workspace_change"] = true })

-- Style Gum confirm to match terminal theme
hl.env("GUM_CONFIRM_PROMPT_FOREGROUND", "6")
hl.env("GUM_CONFIRM_SELECTED_FOREGROUND", "0")
hl.env("GUM_CONFIRM_SELECTED_BACKGROUND", "2")
hl.env("GUM_CONFIRM_UNSELECTED_FOREGROUND", "7")
hl.env("GUM_CONFIRM_UNSELECTED_BACKGROUND", "8")
