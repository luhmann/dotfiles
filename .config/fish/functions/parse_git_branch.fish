function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_color_git_dirty)$branch(set_color normal)
  else
    echo (set_color $fish_color_git_clean)$branch(set_color normal)
  end
end