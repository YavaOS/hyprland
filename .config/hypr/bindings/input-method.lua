-- Same terminal tag test as clipboard.lua.
local function active_window_is_terminal()
  local window = hl.get_active_window()
  if not window then
    return false
  end

  for _, tag in ipairs(window.tags or {}) do
    if tag:gsub("%*$", "") == "terminal" then
      return true
    end
  end

  return false
end

-- Keep the desktop shortcut independent of Fcitx's custom switching keys.
-- Read the live Fcitx group so setup works without a compositor reload.
o.bind("SUPER + I", "Switch input language", "yavaos-input-method cycle")
o.bind("SUPER + SHIFT + I", "Switch input language back", "yavaos-input-method cycle back")

-- XKB's caps_toggle switches even when Super is held, before a binding runs.
-- Keep that action disabled and check the lock only for an unmodified press.
o.bind("code:66", "Switch input language with Caps Lock", function()
  local flag = io.open(os.getenv("HOME") .. "/.local/state/yavaos/toggles/input-language-locked", "r")
  if flag then
    flag:close()
    return
  end
  hl.exec_cmd("yavaos-input-method cycle")
end)
o.bind("SUPER + code:66", "Toggle language switching lock", "yavaos-toggle-input-language-lock")

-- Pass the tmux/Herdr prefix through and return to direct input, so the next
-- key reaches the multiplexer instead of the engine's composition.
o.bind("CTRL + SPACE", "Direct input for the terminal prefix", function()
  if active_window_is_terminal() then
    -- Wait for the local controller reply before dispatching the next key.
    o.shell_succeeds("timeout 0.3 fcitx5-remote --check -c")
  end
end, { non_consuming = true })
