#!/usr/bin/bash

sudo pacman -Syu

de="hyprland hyprlock hyprpaper wofi waybar hyprpicker uwsm qt5-wayland qt6-wayland hyprland-qt-support hyprland-qtutils xdg-desktop-portal-hyprland hyprpolkitagent"
game="steam lutris"
languages="nodejs dotnet-sdk aspnet-runtime"
utils="stow docker postgresql pulseaudio ripgrep sudo-rs bluez bluez-utils gnome-disk-utility"
terminal="yazi starship tmux btop ghostty fish kitty"
extra="zed virtualbox virtualbox-guest-iso obsidian qbittorrent vlc ncspot"
all="$de $game $languages $utils $terminal $extra"

sudo pacman -S $all

# changes defaul shell to fish
chsh -s /usr/bin/fish $whoami

# download rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# setup paru
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

utils="coolercontrol-bin librewolf-bin jetbrains-toolbox"


paru -S $aur
