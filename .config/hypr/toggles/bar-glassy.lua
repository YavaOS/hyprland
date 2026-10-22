-- The Glassy bar: the shell draws the bar see-through, and Hyprland blurs what
-- is behind it.
require("hypr.glass")()

hl.layer_rule({
  match = { namespace = "^(yavaos-bar|yavaos-keyboard-panel)$" },
  blur = true,
  ignore_alpha = 0.3,
})
