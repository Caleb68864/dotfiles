#!/bin/bash
killline="entr -p $HOME/dotfiles/Scripts/md2pdf.sh $1"
# echo $killline
pkill -f "$killline" 
echo "$1" | entr -p $HOME/dotfiles/Scripts/md2pdf.sh "$1" > /dev/null & 
vim -N "$1"
pkill -f "$killline" && exit

