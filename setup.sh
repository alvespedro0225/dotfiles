#!/usr/bin/bash

sudo pacman -Syu

de="hyprland hyprlock hyprpaper wofi waybar hyprpicker uwsm qt5-wayland qt6-wayland hyprland-qt-support hyprland-qtutils xdg-desktop-portal-hyprland hyprpolkitagent"
game="steam lutris"
languages="nodejs dotnet-sdk aspnet-runtime"
utils="stow docker postgresql pulseaudio ripgrep sudo-rs bluez bluez-utils"
terminal="yazi starship tmux btop ghostty fish kitty"
extra="zed virtualbox virtualbox-guest-iso obsidian qbittorrent vlc"
all="$de $game $languages $utils $terminal $extra"

sudo pacman -S "$all"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
