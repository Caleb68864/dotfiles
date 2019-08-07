#!/bin/bash
sudo pacman -Syy
sudo pacman -Su
sudo pacman -S acpi aria2 dmenu fakeroot firefox gcc git make markdown mpv networkmanager openssh python python-pip ranger rofi sudo tmux vim vlc wkhtmltopdf xorg xorg-server xorg-xinit youtube-dl zathura zsh

sudo pip install youtube-dl bs4 pandas numpy 

mkdir -p ~/.local/share
mkdir -p ~/.temp/Commute
mkdir -p ~/.config
mkdir -p ~/.fonts

cd ~
git clone --recurse-submodules https://github.com/Caleb68864/dotfiles

~/dotfiles/deploy

sudo make clean install -C ~/dotfiles/st
sudo make clean install -C ~/dotfiles/slock
sudo make clean install -C ~/dotfiles/slstatus
sudo make clean install -C ~/dotfiles/dwm
