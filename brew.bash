#!/bin/bash

brew tap homebrew/boneyard
brew bundle Brewfile
brew bundle Caskfile

/usr/local/Cellar/fzf/HEAD/install

exit 0
