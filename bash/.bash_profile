#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
export PATH="/home/pedro/.flutter/flutter/bin:$PATH"

# only opens hyprland if there's no hyprland process so that
# it's possible to login on console in other ttys
if [[ ! $( pgrep hyprland) ]]; then
  exec hyprland
fi
