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

# Put local node_modules/.bin in path
export PATH="$PATH:./node_modules/.bin"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# do not add commands starting with a space to history
setopt histignorespace

# use python from homebrew
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
