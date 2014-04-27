#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

#Add some taps
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew tap phinze/cask

# Install more recent versions of some OS X tools
brew install homebrew/dupes/grep
brew install php54

# Install everything else
brew install ag
brew install git
brew install legit
brew install ffmpeg
brew install graphicsmagick
brew install htop
brew install mariadb
brew install wget
brew install rbenv
brew install ssh-copy-id
brew install python
brew install brew-cask

# Install Casks
brew cask install google-chrome
brew cask install vagrant
brew cask install virtualbox
brew cask install slate

# Remove outdated versions from the cellar
brew cleanup

exit 0