#!/bin/bash


# check prerequisites
which brew &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "\nError: Homebrew not installed\n\n"
  exit 1
fi

# fix working dir
cd "$(dirname "${BASH_SOURCE}")"

if [ "$2" != "--no-pull" -a "$2" != "-n" ]; then
  printf "\n# Pulling latest changes...\n"
  git pull
  if [[ $? -ne 0 ]]; then
    printf "\nWarning: git failed pulling the latest version (see details above).\n\n"
  fi
fi

printf "# Syncing to home folder...\n"
function doSync() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.bash" --exclude "Brewfile" --exclude "Caskfile" --exclude "z*" --exclude "*.md" --exclude "*.txt" -av . ~
}

function installFonts() {
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/powerline/fonts/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf' ; }
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/enricobacis/master/osx-fonts/Library/Fonts/Knack%20Regular%20Nerd%20Font%20Complete.ttf' ; }
  cd ~/Library/Fonts && { curl -OL 'https://raw.githubusercontent.com/powerline/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf' ; }
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doSync
  installFonts
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doSync
  else
    printf "Aborted.\n\n"
    exit 0
	fi
fi
unset doSync

