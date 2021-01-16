#!/bin/bash

# generate a new, strong ssh key
ssh-keygen -t ed25519 -C "jfd@daenen4.de"

# wait for the user to add it to github
pbcopy < ~/.ssh/id_ed25519.pub
echo "Now login to https://github.com/settings/keys and add the key that has already been copied to your clipboard."
read -p "Press any key to continue. Ctrl-C to abort."

# install Xcode Command Line Tools
# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
# create the placeholder file that's checked by CLI updates' .dist code
# in Apple's SUS catalog
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# find the CLI Tools update
PROD=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
# install it
softwareupdate -i "$PROD" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

# create dev-folder
mkdir ~/dev

# clone my dotfiles and run install
git clone git@github.com:luhmann/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles && bash install.bash
