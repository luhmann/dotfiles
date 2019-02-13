mash = {"cmd", "alt", "ctrl"}
calt = {"cmd", "ctrl"}

require "spoons"
require "apps"

local volume = require "volume"


local function sleepScreen()
  return hs.execute("pmset displaysleepnow")
end
hs.caffeinate.sleepScreen = sleepScreen

hs.hotkey.bind(mash, "r", function() hs.reload(); end)
hs.hotkey.bind(mash, "l", function() hs.caffeinate.sleepScreen(); end)
-- defeat paste-blocks
hs.hotkey.bind({"cmd", "alt"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
-- mute
hs.hotkey.bind(calt, "o", volume.mute)

hs.alert("Hammerspoon config loaded")
