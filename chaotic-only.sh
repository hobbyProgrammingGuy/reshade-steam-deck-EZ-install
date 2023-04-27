#!/bin/bash

#Disable SteamOS ReadOnly

sudo steamos-readonly disable

#Make pacman actually work by making it a full Arch Distro.
#This makes it work for limited distro stuff, but we want full capabilities:

#Initiate pacman-keys
sudo pacman-key --init

#Populate the new linux system
sudo pacman-key --populate archlinux

#Make pacman work for just about anything else too by utilizing chaotic-aur. Don’t install too much though.

#Debug (before or after?)

#First, install the primary key - it can then be used to install our keyring and mirrorlist.
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

grep -qxF '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf || echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' | sudo tee -a /etc/pacman.conf

#Proper update to get the repository into pacman.

if sudo pacman -Syy; then

echo "Success: Updated pacman repository successfully."

else

echo "Success: Already Updated."
fi
