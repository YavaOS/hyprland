hl.bind("SUPER + period", hl.dsp.exec_cmd("hypremoji"))
hl.window_rule({ match = { title = "^(HyprEmoji)$" }, float = true,
    move = "(cursor_x-(window_w*0.5)) (cursor_y-(window_h*0.95))", size = "307 340" })
