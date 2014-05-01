#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew bundle Brewfile
brew bundle Caskfile

# Remove outdated versions from the cellar
brew cleanup

exit 0