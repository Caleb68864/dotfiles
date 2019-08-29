#!/bin/bash
sudo pacman -S rofi dmenu sed grep
yay -S paper-icon-theme-git

mkdir -p ~/.config/rofi

cp ~/dotfiles/rofi-menus/config.rasi ~/.config/rofi/
cp -r ~/dotfiles/rofi-menus/scripts ~/.config/rofi/
sudo chmod +x ~/.config/rofi/scripts/*
cp -r ~/dotfiles/rofi-menus/themes ~/.config/rofi/
