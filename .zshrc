export ZPLUG_HOME=/usr/local/opt/zplug
source ~/.zplug

# configure zsh-plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Command prompt config
asdf_node_version() {
    local node_version=$(asdf current nodejs | awk '{print $1;}')
    echo -n "$node_version" 
}
POWERLEVEL9K_CUSTOM_ASDF_NODE_VERSION="asdf_node_version"
POWERLEVEL9K_CUSTOM_ASDF_NODE_VERSION_BACKGROUND="green"
POWERLEVEL9K_CUSTOM_ASDF_NODE_VERSION_FOREGROUND="white"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_asdf_node_version vi_mode)

# Hook up aliases
source ~/.aliases

# Put local node_modules/.bin in path
export PATH="$PATH:./node_modules/.bin"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--multi --reverse' 

# history setup
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g:youtube-dl"

# enable nvm - disabled in favor of asdf
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# use python from homebrew
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# source env variables from a local file if it exists
[ -f ~/.local_env ] && source ~/.local_env
