#!/bin/bash

# Contains operations that only need to run once when installing a new machine

function installFonts() {
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/powerline/fonts/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf' ; }
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/enricobacis/master/osx-fonts/Library/Fonts/Knack%20Regular%20Nerd%20Font%20Complete.ttf' ; }
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/powerline/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf' ; }

  # "Input Mono" (preferred editor-font) is not available for direct download
  open 'http://input.fontbureau.com/download/'
}

function setItermPreferences() {
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dev/dotfiles"
  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
}

# check if this is still required, there was talk about a dotfile that could configure this
function installAsdfPlugins() {
  asdf plugin-add nodejs
  asdf plugin-add java
}

function setupHammerspoon() {
  # open -a Hammerspoon - open hammerspoon if menu-item and dock-item are disabled
  # cmd + , -- open preferences
  defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.hammerspoon/init.lua"
}

installFonts
setItermPreferences
installAsdfPlugins
setupHammerspoon
