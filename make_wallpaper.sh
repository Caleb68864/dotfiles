#!/bin/bash
wkhtmltoimage  --quality 100 --width 3840 --height 2160 Keybind_Wallpaper/Keybind_Wallpaper.html KB_Wall.jpg
feh --bg-max ~/dotfiles/KB_Wall.jpg
