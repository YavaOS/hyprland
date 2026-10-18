-- Dropdown terminal shares the scratchpad used by the personal bindings.
o.window({ title = "^(kitty-dropdown)$" }, {
  float = true,
  size = { "(monitor_w*1)", "(monitor_h*0.8)" },
  move = { "(0)", "(50)" },
  workspace = "special:scratchpad",
})
