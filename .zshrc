#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Command prompt config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir nvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version vi_mode)

# Configure autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Hook up aliases
source ~/.aliases

# Configure default editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
