#!/bin/bash
sudo pacman -Syy
sudo pacman -Su
sudo pacman -S acpi aria2 compton cronie curl dmenu fakeroot feh firefox fuse fuse-common fzf gcc git go htop make markdown mpv networkmanager openssh python python-pip ranger rofi sudo tigervnc tmux vim vlc vsftpd wkhtmltopdf wget xorg xorg-server xorg-xinit youtube-dl zathura zathura-pdf-mupdf zathura-ps zathura-cb zsh

sudo pip install bs4 numpy pandas youtube-dl

~/dotfiles/install_scripts/Arch/yay_setup.sh

yay -S xorgxrdp xrdp vivaldi google-chrome

mkdir -p ~/.local/share
mkdir -p ~/.temp/Commute
mkdir -p ~/.temp/Videos
mkdir -p ~/.config
mkdir -p ~/.fonts

cd ~
git clone --recurse-submodules https://github.com/Caleb68864/dotfiles

~/dotfiles/deploy

~/dotfiles/install_scripts/rofi_menu_setup.sh
~/dotfiles/install_scripts/suckless_setup.sh

echo "[Socket]" | sudo tee /etc/systemd/system/sshd.socket.d/override.conf 
echo "ListenStream=" | sudo tee -a /etc/systemd/system/sshd.socket.d/override.conf 
echo "ListenStream=22" | sudo tee -a /etc/systemd/system/sshd.socket.d/override.conf 

sudo systemctl start cronie
sudo systemctl start NetworkManager
sudo systemctl start sshd.socket
sudo systemctl start vsftpd

sudo systemctl enable cronie
sudo systemctl enable NetworkManager
sudo systemctl enable sshd.socket
sudo systemctl enable vsftpd
