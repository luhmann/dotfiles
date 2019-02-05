hs.loadSpoon("WindowHalfsAndThirds")

hs.window.animationDuration = 0
spoon.WindowHalfsAndThirds:bindHotkeys({
  left_half   = { mash, "Left" },
  right_half  = { mash, "Right" },
  top_half    = { mash, "Up" },
  bottom_half = { mash, "Down" },
  max         = { mash, "m" },
})

hs.loadSpoon("WindowScreenLeftAndRight")

spoon.WindowScreenLeftAndRight:bindHotkeys({
  screen_left = { calt, "Left" },
  screen_right= { calt, "Right" },
})
