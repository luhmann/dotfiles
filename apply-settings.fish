#!/usr/local/bin/fish

# setup fish universal variables

set -U fish_color_autosuggestion 555 yellow
set -U fish_color_command 5f87d7
set -U fish_color_comment 808080
set -U fish_color_cwd 87af5f
set -U fish_color_cwd_root 5f0000
set -U fish_color_error 870000 --bold
set -U fish_color_escape af5f5f
set -U fish_color_history_current 87afd7
set -U fish_color_host 5f87af
set -U fish_color_match d7d7d7 --background=303030
set -U fish_color_normal normal
set -U fish_color_operator d7d7d7
set -U fish_color_param 5f87af
set -U fish_color_quote d7af5f
set -U fish_color_redirection normal
set -U fish_color_search_match --background=purple
set -U fish_color_status 5f0000
set -U fish_color_user 5f875f
set -U fish_color_valid_path --underline

set -U fish_color_dimmed 555
set -U fish_color_separator 999

set -U fish_color_git_clean green
set -U fish_color_git_staged yellow
set -U fish_color_git_dirty red

set -U fish_color_git_added green
set -U fish_color_git_copied magenta
set -U fish_color_git_deleted 666
set -U fish_color_git_modified blue
set -U fish_color_git_renamed magenta
set -U fish_color_git_unmerged yellow
set -U fish_color_git_untracked red

set -U fish_greeting ""

set -U fish_pager_color_completion normal
set -U fish_pager_color_description 555 yellow
set -U fish_pager_color_prefix cyan
set -U fish_pager_color_progress cyan

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

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
~
