#! /usr/bin/python3

import subprocess

def run_cmd(cmd):
    try:
        subprocess.call(cmd.split(" "))
    except Exception as e:
        print(e)

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
run_cmd(" ".join(apps))


