mash = {"cmd", "alt", "ctrl"}
calt = {"cmd", "ctrl"}

require "spoons"
require "apps"


hs.hotkey.bind(mash, "r", function() hs.reload(); end)
hs.hotkey.bind(mash, "l", function() hs.caffeinate.lockScreen(); end)
-- defeat paste-blocks
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
hs.alert("Hammerspoon config loaded")
