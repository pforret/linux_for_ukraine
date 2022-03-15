#!/bin/bash
# cf https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/
sudo apt update
sudo apt upgrade -y

# APT installs
sudo apt install -y

## SNAP installs
sudo snap install vlc thunderbird

## FLATPACK installs
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#sudo flatpak install flatpak1 flatpak2 flatpak3 -y


## Add User
sudo adduser ukraine