#!/bin/bash
# clone the repo
cd ~
git clone https://github.com/sherlock-project/sherlock.git

# change the working directory to sherlock
cd sherlock

# install python3 and python3-pip if they are not installed
sudo apt install python3 python3-pip
sudo pacman -S python3 python3-pip
# install the requirements
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install setuptools
sudo python3 -m pip install -r requirements.txt
