#!/bin/bash
killline="entr -n -p $HOME/dotfiles/Scripts/md2pdf.sh $1"
# echo $killline
pkill -f "$killline" 
echo "$1" | entr -n -p $HOME/dotfiles/Scripts/md2pdf.sh "$1" > /dev/null & 
vim -N "$1"
pkill -f "$killline" && exit

