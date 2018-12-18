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
apps.append("gcc")
apps.append("libxft2")
apps.append("libxft2-dev")
run_cmd(" ".join(apps))

#Clone st
run_cmd("git clone --recursive https://github.com/LukeSmithxyz/st")
run_cmd("make -C st")
run_cmd("sudo make install -C st")
