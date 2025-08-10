#!/bin/sh

# Update package list
sudo apt update

# Display Server and related packages
sudo apt -y install xorg xorg-dev xbacklight xbindkeys xvkbd xinput pkg-config

# Build Tools
sudo apt -y install build-essential meson ninja-build make cmake clang

# Window manager and accompanying packages
sudo apt -y install wmctrl xdo xdotool bspwm terminator sxhkd polybar rofi suckless-tools librewolf \
    gvfs-backends dialog mtools smbclient cifs-utils ripgrep fd-find unzip zip network-manager \
    network-manager-gnome lxappearance dosfstools libnotify libnotify-dev libnotify-bin \
    bluez blueman rxvt-unicode dunst qt5ct qt6ct

# Enable Bluetooth
sudo systemctl enable --now bluetooth

# Allow all users to run without needing sudo to install packages
sudo apt install -y gdebi synaptic

# Audio
sudo apt -y install pavucontrol pulsemixer pamixer pipewire-audio

# Fonts
sudo apt -y install fonts-recommended fonts-font-awesome fonts-terminus

# Power management
sudo apt -y install avahi-daemon acpi acpid
sudo systemctl enable --now acpid

# XDG user directories
sudo apt -y install xdg-user-dirs-gtk

# Make config directories
mkdir -p ~/.config/{bspwm,sxhkd,dunst,polybar,rofi,dmenu}

# Fix gdebi and syanptic so they will not annoy you
sudo chmod u+s  /usr/bin/apt, /usr/bin/gdebi, /usr/sbin/synaptic
