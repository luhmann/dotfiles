#!/bin/bash

# Lets do everything at once

# Lets do some os settings
# ./osx.bash

# Install non homebrew dependencies
./nonbrew.bash

# Install homebrew dependencies
./brew.bash

# Get NPM into the game
./npm.bash

# and now python
./python.bash

# ruby wants to play too
./ruby.bash

# now do the shells
./bootstrap.bash
