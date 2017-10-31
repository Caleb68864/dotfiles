sudo pacman -S vim vlc guake tint2 atom python openssh filezilla clementine tmux python-pip gimp inkscape deluge playonlinux aria2 scrot zathura rofi zsh avahi system-printer-config cups cups-pdf

yaourt --m-arg "--skippgpcheck" -S pithos youtube-dl google-chrome obmenu-generator i3blocks-git i3lock-fancy

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon

sudo systemctl enable cups-browsed
sudo systemctl start cups-browsed

sudo systemctl enable sshd.socket
sudo systemctl start sshd.socket

sudo pip install pandas xlrd numpy flask django pyinstaller sqlalchemy

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
