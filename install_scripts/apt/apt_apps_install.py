#! /usr/bin/python3

import subprocess

def run_cmd(cmd):
    try:
        subprocess.call(cmd.split(" "))
    except Exception as e:
        print(e)

# update apt
run_cmd("sudo apt update")

# install required apps
apps = []
apps.append("sudo apt install -y")
apps.append("make")
apps.append("cmake")
apps.append("gcc")
apps.append("pithos")
apps.append("vlc")
apps.append("zsh")
apps.append("tmux")
apps.append("youtube-dl")
apps.append("git")
apps.append("python")
apps.append("python3")
apps.append("python-pip")
apps.append("python3-pip")
apps.append("vim")
apps.append("network-manager")
apps.append("ranger")
#apps.append("feh")
apps.append("sxiv")
apps.append("w3m")
apps.append("fonts-font-awesome")
apps.append("rofi")
apps.append("dmenu")
apps.append("filezilla")
apps.append("")

run_cmd(" ".join(apps))

# upgrade system
run_cmd("sudo apt upgrade -y")

# remove old packages from system
run_cmd("sudo apt autoremove -y")
