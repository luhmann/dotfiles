## Profiling zsh - used in conjungction with `zprof`-command on the bottom
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi


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

# Hook up aliases
source ~/.aliases

# Put local node_modules/.bin in path
export PATH="$PATH:./node_modules/.bin"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--multi --reverse'

# history setup
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g:youtube-dl"


# use python from homebrew
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

eval "$(fasd --init auto)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jfd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jfd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jfd/google-cloud-sdk/completion.zsh.inc'; fi

# powerlevel 10k: To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(/opt/homebrew/bin/mise activate zsh)"

# enable postgresql-tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# doom-emacs tools
export PATH="$HOME/.emacs.d/bin:$PATH"

# source env variables from a local file if it exists
[ -f ~/.local_env ] && source ~/.local_env

# Profiling for zsh load speed - used in conjungtion with the other `zprof` command on top of this file
# zprof
