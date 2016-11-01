#!/bin/bash

# Lets do everything at once

# Lets do some os settings
# ./osx.bash

# Install non homebrew dependencies
./nonbrew.bash

# Install homebrew dependencies
./brew.bash

# and now python
./python.bash

# now do the shells
./bootstrap.bash
