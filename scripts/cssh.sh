#!/bin/bash
#

if [ "$2" ]; then
    exec ssh $*
fi

hostspec=$1
host=$(echo $hostspec | sed -e 's/^.*@//' -e 's/\..*$//')

# The default opacity value if not specified (0-65535)
#default_opacity=65535

# The default color which will be used when not connected to any host.
default_color="2048, 2048, 2048"  # , $default_opacity"

case "$host" in
### Add matching host cases here:
    daenen) host_color="3328, 10080, 10080";;
    int-)  host_color="768, 768, 11808";;
    lnxv-)  host_color="815, 8175, 11717";;
    devbox) host_color="4000, 9000, 4000";;
########################################################################

    *)  # Compute default color based on first three letters of hostname
    declare -a cols
#    cols=($(echo -ne ${host/[a-z]*@//} | tr 'A-Z' 'a-z' | tr -cd 'a-z' | \
#            od -t d1 | head -n1 | cut -c10-22));
    host_color=$(perl -e '
          $DARKNESS = 4;
          $host = $ARGV[0];
          while ($host =~ /(.)/g) { $seed += ord($1) };
          srand($seed);
          for (1..3) {
              $c = int(rand() * 65535);
              if ($c > (65535/$DARKNESS)) {
                  $c = $c / $DARKNESS
              }
              push @colors, $c;
          };
          print join (", ", @colors);
      ' $host)
    ;;
esac

window_name="${host}_SSH_$$"

trap cleanup 1 2 3 6

function cleanup() {
    set_color "$default_color"
    echo -ne "\033]0;\007"
}

function set_color() {
    case "$TERM_PROGRAM" in
    Apple_Terminal)
        echo -ne "\033]0;${window_name}\007"
        osascript -e 'tell application "Terminal" to tell (first window whose name contains "'${window_name}'") to set background color to {'"$1"'}'
        ;;
    iTerm.app)
        osascript -e 'tell application "iTerm" to set background color of (current session of current terminal) to {'"$1"'}'
        ;;
    esac
}

set_color "$host_color"
LOCAL_TERMCOLOR="$host_color" ssh -o SendEnv=LOCAL_TERMCOLOR $hostspec
cleanup