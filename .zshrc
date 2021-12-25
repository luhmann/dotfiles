## Profiling zsh - used in conjungction with `zprof`-command on the bottom
# zmodload zsh/zprof

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

source ~/.zinitrc

# configure zsh-plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=9"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version custom_wifi_signal)

# Hook up aliases
source ~/.aliases

# Put local node_modules/.bin in path
# export PATH="$PATH:./node_modules/.bin"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--multi --reverse'

# history setup
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g:youtube-dl"

# cant remember why I never used fnm, lets try again
eval "`fnm env --use-on-cd`"

# enable nvm - disabled in favor of fnm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# use python from homebrew
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

eval "$(fasd --init auto)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jfd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jfd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/completion.zsh.inc'; fi

# source env variables from a local file if it exists
[ -f ~/.local_env ] && source ~/.local_env

# Profiling for zsh load speed - used in conjungtion with the other `zprof` command on top of this file
# zprof
