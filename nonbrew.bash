#!/bin/bash

# Install Homebrew
which brew &> /dev/null
if [[ $? -ne 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install command-line tools
xcode-select --install

