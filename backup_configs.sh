mkdir -p ~/github/dotfiles/i3_config
mkdir -p ~/github/dotfiles/i3_config/i3blocks
mkdir -p ~/github/dotfiles/openbox_config
mkdir -p ~/github/dotfiles/tint2_config
mkdir -p ~/github/dotfiles/polybar_config
mkdir -p ~/github/dotfiles/fonts
mkdir -p ~/github/dotfiles/vim
mkdir -p ~/github/dotfiles/bspwm
mkdir -p ~/github/dotfiles/sxhkd

cp -r ~/.config/i3/* ~/github/dotfiles/i3_config
cp -r /usr/lib/i3blocks/* ~/github/dotfiles/i3_config/i3blocks
cp -r /etc/i3status.conf ~/github/dotfiles/i3_config
cp -r ~/.config/openbox/* ~/github/dotfiles/openbox_config
cp -r ~/.config/tint2/* ~/github/dotfiles/tint2_config
cp -r ~/.config/polybar/* ~/github/dotfiles/polybar
cp -r ~/.config/bspwm/* ~/github/dotfiles/bspwm
cp -r ~/.config/sxhkd/* ~/github/dotfiles/sxhkd
cp ~/.config/compton.conf ~/github/dotfiles/
cp ~/.Xdefaults ~/github/dotfiles/
cp -r ~/.fonts/* ~/github/dotfiles/fonts
cp ~/.vimrc ~/github/dotfiles/vim
cp -r ~/.vim ~/github/dotfiles/vim

git config --global user.email "i3@arch"
git config --global user.name "Caleb Bennett"


git add -A
DATE=$(date +"%Y-%m-%d %H:%M:%S")
#echo $DATE
git commit -m "$DATE"
#git remote add origin https://github.com/Caleb68864/dotfiles.git
git push origin master
