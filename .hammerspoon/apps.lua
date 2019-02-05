local function toggleApplication(name)
  local app = hs.application.find(name)
  if not app then
    hs.application.launchOrFocus(name)
  elseif app:isHidden() then
    app:unhide()
    app:activate()
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

-- applications
hs.hotkey.bind(mash, "g", function() toggleApplication("Google Chrome") end)
hs.hotkey.bind(mash, "f", function() toggleApplication("Finder") end)
hs.hotkey.bind(mash, "p", function() toggleApplication("System Preferences") end)
hs.hotkey.bind(mash, "s", function() toggleApplication("Spotify") end)
hs.hotkey.bind(mash, "i", function() toggleApplication("iTerm2") end)
hs.hotkey.bind(mash, "c", function() toggleApplication("Code") end)

-- application
hs.hotkey.bind(calt, "n", function() hs.spotify.next() end)
hs.hotkey.bind(calt, "p", function() hs.spotify.previous() end)
hs.hotkey.bind(calt, "s", function() hs.spotify.playpause() end)
