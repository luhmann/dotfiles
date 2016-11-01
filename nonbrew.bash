#!/bin/bash

# Install Homebrew
which brew &> /dev/null
if [[ $? -ne 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install neobundle for vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# install command-line tools
xcode-select --install

