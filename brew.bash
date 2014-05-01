#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

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
brew install iftop
brew install sitespeed.io
brew install vim
brew install ngrep
brew install brew-cask

# Install Casks
brew tap caskroom/versions
brew cask install alfred
brew cask install dropbox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install iterm2
brew cask install firefox
brew cask install spotify
brew cask install skype
brew cask install vagrant
brew cask install virtualbox
brew cask install slate
brew cask install cd-to
brew cask install xee
brew cask install totalfinder
brew cask install transmission


# Remove outdated versions from the cellar
brew cleanup

exit 0