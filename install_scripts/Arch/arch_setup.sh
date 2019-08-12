#!/bin/bash
sudo pacman -Syy
sudo pacman -Su
sudo pacman -S acpi aria2 compton cronie dmenu fakeroot feh firefox fuse fuse-common fzf gcc git go htop make markdown mpv networkmanager openssh python python-pip ranger rofi sudo tigervnc tmux vim vlc vsftpd wkhtmltopdf xorg xorg-server xorg-xinit youtube-dl zathura zsh

sudo pip install bs4 numpy pandas youtube-dl

~/dotfiles/install_scripts/Arch/yay_setup.sh

yay -S xorgxrdp xrdp

mkdir -p ~/.local/share
mkdir -p ~/.temp/Commute
mkdir -p ~/.temp/Videos
mkdir -p ~/.config
mkdir -p ~/.fonts

cd ~
git clone --recurse-submodules https://github.com/Caleb68864/dotfiles

~/dotfiles/deploy

~/dotfiles/install_scripts/suckless_setup.sh

sudo systemctl start cronie
sudo systemctl start NetworkManager
sudo systemctl start sshd
sudo systemctl start vsftpd

sudo systemctl enable cronie
sudo systemctl enable NetworkManager
sudo systemctl enable sshd
sudo systemctl enable vsftpd
