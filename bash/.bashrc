#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Updating PATH

export PATH="$PATH:/home/pedro/.dotnet/tools" #dotnet
export PATH="$PATH:/usr/bin/kitty" #kitty
export PATH="$PATH:/home/pedro/Emulation/Emulators/3DS/Borked" #3ds emu
export PATH="$PATH:/home/pedro/Emulation/Switch/Ryujinx"
export PATH="$PATH:/home/pedro/.cargo/bin"

# Exporting ENV variables

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
export EDITOR=nvim
export TERM=ghostty
export ELECTRON_OZONE_PLATFORM_HINT=wayland

exec fish
