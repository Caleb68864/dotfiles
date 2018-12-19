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
apps.append("compton")
apps.append("gcc")
apps.append("build-essential")
apps.append("xcb")
apps.append("libxcb-composite0")
apps.append("libxcb-composite0-dev")
apps.append("build-essential git cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev")
apps.append("cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev")
run_cmd(" ".join(apps))

#Clone st
run_cmd("git clone --recursive https://github.com/jaagr/polybar polybar_build")
run_cmd("make -C polybar_build")
run_cmd("sudo make install -C polybar_build")
run_cmd("sudo rm -R polybar_build")

