-- App rules, loaded once in a stable order.
local paths = require("hypr.paths")
require("hypr.require_all").files(paths.home .. "/.config/hypr/apps", "hypr.apps")
