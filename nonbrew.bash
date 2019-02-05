#!/bin/bash

# make git, make, etc available
sudo softwareupdate -i -a
xcode-select --install

# Install Homebrew
which brew &> /dev/null
if [[ $? -ne 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

