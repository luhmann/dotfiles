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
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "init" --exclude "*.bash" --exclude "Brewfile" --exclude "Caskfile" --exclude "python.bash" --exclude "z*" --exclude "*.md" --exclude "*.txt" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doSync
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

printf "\n# Checking for zsh... "
brew ls zsh &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "not found, installing...\n\n"
  brew update
  if [[ $? -ne 0 ]]; then
    printf "\nError: Homebrew update failed. Aborting.\n\n"
    exit 1
  fi
  brew install zsh 
  if [[ $? -ne 0 ]]; then
    printf "\nError: fish installation failed. Aborting.\n\n"
    exit 1
  fi
  printf "\nSee instructions above for making fish the default shell.\n"
else
  printf "ok.\n\n"
fi

printf "# Setting up/refreshing zsh settings (i.e. universal variables)... "
ls ~/.zprezto
if [[ $? -ne 0 ]]; then
  printf "\nPrezto not found, installing\n\n"
  
  # Clone prezto
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  
  # copy prezto config files
  cp -n zpreztorc zprofile zshrc "${ZDOTDIR:-$HOME}/.zprezto/runcoms"

  # Link config files

  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogin" "${ZDOTDIR:-$HOME}/.zlogin"
  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogout" "${ZDOTDIR:-$HOME}/.zlogout"
  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc"
  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zprofile" "${ZDOTDIR:-$HOME}/.zprofile"
  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv" "${ZDOTDIR:-$HOME}/.zshenv"
  ln -s  "${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc" "${ZDOTDIR:-$HOME}/.zshrc"

  # Get theme
  git clone https://github.com/bhilburn/powerlevel9k.git "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/external/powerlevel9k"
  ln -s "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/external/powerlevel9k/powerlevel9k.zsh-theme" "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup"
else
  printf "done.\n\n"
fi
