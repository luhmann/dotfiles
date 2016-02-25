function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __informative_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n ' $ '

end



function __cmd_duration -S -d 'Show command duration'
  [ "$CMD_DURATION" -lt 100 ]; and return

  if [ "$CMD_DURATION" -lt 5000 ]
    echo -ns $CMD_DURATION 'ms '
  else if [ "$CMD_DURATION" -lt 60000 ]
    math "scale=1;$CMD_DURATION/1000" | sed 's/\\.0$//'
    echo -ns 's '
  else if [ "$CMD_DURATION" -lt 3600000 ]
    set_color $fish_color_error
    math "scale=1;$CMD_DURATION/60000" | sed 's/\\.0$//'
    echo -ns 'm '
  else
    set_color $fish_color_error
    math "scale=2;$CMD_DURATION/3600000" | sed 's/\\.0$//'
    echo -ns 'h '
  end
end

function fish_right_prompt -d 'The right hand side of my pretty fish prompt'
    set -l _display_status $status
    printf "%s %s" (__cmd_duration) $_display_status

end
