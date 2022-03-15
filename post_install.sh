#!/bin/bash
# cf https://www.addictivetips.com/ubuntu-linux-tips/make-ubuntu-post-installation-script/
function get_system_info(){
	sudo dmidecode -t "${2:-system}" \
	| awk -F: -v keyword=${1:-Serial}'
		function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
		function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
		function trim(s) { return rtrim(ltrim(s)); }
		/keyword/ {print $2}
		'
}

function random_password(){
	printf '%x%x\n' $RANDOM $RANDOM
}

manufacturer=$(get_system_info "Manufacturer")
product_name=$(get_system_info "Product Name")
serial_number=$(get_system_info "Serial")

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# APT installs
# sudo apt install -y

## SNAP installs
sudo snap install vlc thunderbird chromium firefox teams zoom-client telegram-desktop slack skype singlebox

## FLATPACK installs
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#sudo flatpak install flatpak1 flatpak2 flatpak3 -y

## Install Ukrianian language support
# cf https://askubuntu.com/questions/149876/how-can-i-install-one-language-by-command-line
sudo apt-get install wukrainian 

## Add User
newuser=ukraine
echo "USERNAME: $newuser"
password="$(random_password)"
echo "PASSWORD: $password"
sudo useradd "$newuser" -p "$password" -g sudo
sudo passwd "$newuser"
