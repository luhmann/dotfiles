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

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps%{%f%}"
        fi
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm custom_wifi_signal vi_mode)

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
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# use python from homebrew
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jfd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jfd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/completion.zsh.inc'; fi

# source env variables from a local file if it exists
[ -f ~/.local_env ] && source ~/.local_env
