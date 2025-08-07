#!/usr/bin/bash

sudo pacman -Syu

de="hyprland hyprlock hyprpaper wofi waybar hyprpicker uwsm qt5-wayland qt6-wayland hyprland-qt-support hyprland-qtutils xdg-desktop-portal-hyprland hyprpolkitagent"
game="lutris"
languages="nodejs dotnet-sdk aspnet-runtime"
utils="stow docker postgresql pulseaudio ripgrep sudo-rs bluez bluez-utils gnome-disk-utility"
terminal="yazi starship tmux btop ghostty fish kitty"
extra="zed virtualbox virtualbox-guest-iso obsidian qbittorrent vlc ncspot"
all="$de $game $languages $utils $terminal $extra"

sudo pacman -S --needed $all
# steam cockblocks all instalations if multilib is disabled
sudo pacman -S --needed steam
# changes defaul shell to fish
chsh -s /usr/bin/fish $whoami

# download rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# symlinking dotfiles into respective configs
cd ~/.dotifles
stowed=("fish ghostty hypr nvim starship tmux waybar wofi yazi")
# god bless stow
for item in $stowed; do 
	rm ~/.config/$item -rf
	stow $item
done
# bash doesn't have a config file
rm ~/.bashrc
rm ~/.bash_profile
stow bash

services=("bluetooth ")

for service in $services; do
	systemctl enable "$service.service"
done

# setup paru
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

aur="coolercontrol-bin librewolf-bin jetbrains-toolbox"

paru -S --needed $aur
