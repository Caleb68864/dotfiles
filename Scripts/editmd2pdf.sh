#!/bin/bash
pkill -f "entr -p $HOME/dotfiles/Scripts/md2pdf.sh $1" && exit
echo "$1" | entr -p $HOME/dotfiles/Scripts/md2pdf.sh "$1" > /dev/null & 
vim "$1"
pkill -f "entr -p $HOME/dotfiles/Scripts/md2pdf.sh \"$1\"" && exit
