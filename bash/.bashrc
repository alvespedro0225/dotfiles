#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Start ssh agent if none started
#
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Updating PATH

export PATH="$PATH:/home/pedro/.dotnet/tools" #dotnet
export PATH="$PATH:/usr/bin/kitty" #kitty
export PATH="$PATH:/home/pedro/.cargo/bin"
export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:$HOME/bin"

# Exporting ENV variables

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
export EDITOR=nvim
export ELECTRON_OZONE_PLATFORM_HINT=wayland

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} -le 2 ]]
then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi
