#Aliases
function ...
  cd ../..
end

function ....
  cd ../../..
end

function psg -d "Grep for a running process, returning its PID and full string"
    ps auxww | grep --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

set -g -x EDITOR vim

# Homebrew
set --export PATH /usr/local/bin /usr/local/sbin $PATH

# Npm binaries
set --export PATH /usr/local/share/npm/bin $PATH

# Node
set --export NODE_PATH /usr/local/lib/node_modules

# Color grep output
set --export GREP_OPTIONS --color=auto

# Rbenv
set --export PATH $HOME/.rbenv/bin $PATH
set --export PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

#Vagrant
set --export VAGRANT_DEFAULT_PROVIDER parallels

# Homebrew Casks
set --export HOMEBREW_CASK_OPTS --appdir=/Applications

# expose PATH to graphical apps
launchctl setenv PATH $PATH

source (brew --prefix php-version)/php-version.sh and php-version 5
