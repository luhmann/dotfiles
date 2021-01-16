#!/bin/bash

# Install Homebrew
which brew &> /dev/null
if [[ $? -ne 0 ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

