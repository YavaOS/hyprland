local paths = require("hypr.paths")
local require_all = require("hypr.require_all")

local toggles_dir = paths.state_home .. "/yavaos/toggles/hypr"
package.path = toggles_dir .. "/?.lua;" .. package.path

require_all.files(toggles_dir, nil, {
  reload = true,
  exclude = {
    ["touchpad-disabled"] = true,
    ["touchscreen-disabled"] = true,
  },
})

local disabled_input_device = require("hypr.disabled-input-device")
disabled_input_device("touchpad")
disabled_input_device("touchscreen")

require("hypr.workspace-layouts")
