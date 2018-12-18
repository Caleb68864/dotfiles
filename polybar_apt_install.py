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
apps.append("libcairo2-dev")
run_cmd(" ".join(apps))

#Clone st
run_cmd("git clone --recursive https://github.com/jaagr/polybar polybar_build")
run_cmd("make -C polybar_build")
run_cmd("sudo make install -C polybar_build")
run_cmd("sudo rm -R polybar_build")

