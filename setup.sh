#!/usr/bin/bash

sudo pacman -Syu
null="/dev/null"

de="hyprland hyprlock hyprpaper wofi waybar hyprpicker hyprshot uwsm qt5-wayland qt6-wayland hyprland-qt-support xdg-desktop-portal-hyprland hyprpolkitagent"
languages="nodejs dotnet-sdk aspnet-runtime shellcheck"
utils="stow docker postgresql ripgrep sudo-rs gnome-disk-utility fd"
terminal="yazi starship tmux btop ghostty fish kitty"
extra="zed obsidian qbittorrent vlc ncspot"
all="$de $languages $utils $terminal $extra"

sudo pacman -S --needed $all
# steam blocks installs if multilib is disabled
sudo pacman -S --needed steam

# download rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

symlinking dotfiles into respective configs
cd ~/.dotifles || exit 1
stowed=("fish ghostty hypr nvim starship tmux waybar wofi yazi")

for item in "${stowed[@]}"; do
	rm ~/.config/"$item" -rf
	stow "$item"
done
# bash doesn't have a config file
rm ~/.bashrc
rm ~/.bash_profile
stow bash

services=("bluetooth")

for service in "${services[@]}"; do
	systemctl enable "$service.service"
done

# setup paru
cd "$HOME" &> "$null" || echo "failed to cd into \$HOME. \$HOME: $HOME" && exit 1
git clone https://aur.archlinux.org/paru.git
cd paru &> "$null" || echo "" exit 1
makepkg -si

aur="coolercontrol-bin librewolf-bin jetbrains-toolbox"

paru -S --needed "$aur"
