
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

grep -qxF '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf || echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' | sudo tee -a /etc/pacman.conf

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
#Install vkbasalt

if sudo pacman -S --noconfirm vkbasalt; then

echo "Success: Installed vkbasalt successfully."

else

echo "Error: Failed to install vkbasalt. There is something wrong with your Chaotic-AUR setup." >&2

exit 1

fi

#Install goverlay dependencies

if sudo pacman -S --noconfirm mangohud mesa-demos vulkan-tools replay-sorcery git qt5pas breeze; then

echo "Success: Installed goverlay dependencies successfully."

else

echo "Error: Failed to install goverlay dependencies. Check Chaotic-AUR repository or installation of Chaotic-AUR, and keyrings." >&2

exit 1

fi

#Install goverlay

if sudo pacman -S --noconfirm goverlay; then

echo "Success: Installed goverlay successfully."

else

echo "Error: Failed to install goverlay. Check Chaotic-AUR repository or installation of Chaotic-AUR, and keyrings." >&2

exit 1

fi

echo "Success, now run 'goverlay' in the terminal, configure it to run with steam, and download your shaders, and be mindful of ones that don't work: Visit this site for useful information regarding what works and what doesn't currently: https://github.com/gripped/vkBasalt-working-reshade-shaders"
