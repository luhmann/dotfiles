export ZPLUG_HOME=/usr/local/opt/zplug
source ~/.zplug

# configure zsh-plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Command prompt config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir nvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version vi_mode)

# Hook up aliases
source ~/.aliases

# Put local node_modules/.bin in path
export PATH="$PATH:./node_modules/.bin"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set JAVA_HOME
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# history setup
setopt hist_ignore_space
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g:youtube-dl"

# setup enhancd
ENHANCD_FILTER=fzf
export ENHANCD_FILTER

export FZF_DEFAULT_OPTS='--multi --extended --reverse' 

# enable nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# use python from homebrew
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# source env variables from a local file if it exists
[ -f ~/.local_env ] && source ~/.local_env
