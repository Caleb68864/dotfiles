#!/bin/bash

# rofi-power
# Use rofi to call systemctl for shutdown, reboot, etc

# 2016 Oliver Kraitschy - http://okraits.de

OPTIONS="Reboot system\nPower-off system\nSuspend system\nHibernate system"

# source configuration or use default values
if [ -f $HOME/.config/rofi-power/config ]; then
  source $HOME/.config/rofi-power/config
else
  LAUNCHER="rofi -width 30 -dmenu -i -p rofi-power:"
  USE_LOCKER="false"
  LOCKER="slock"
fi

# Show exit wm option if exit command is provided as an argument
if [ ${#1} -gt 0 ]; then
  OPTIONS="Exit window manager\n$OPTIONS"
fi

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval $1
        ;;
      Reboot)
        shutdown -r now
        systemctl reboot
        reboot
        sudo shutdown -r now
        ;;
      Power-off)
        shutdown -h now
        systemctl poweroff
        poweroff
        sudo shutdown -h now
        ;;
      Suspend)
        $($USE_LOCKER) && "$LOCKER"; systemctl suspend
        ;;
      Hibernate)
        $($USE_LOCKER) && "$LOCKER"; systemctl hibernate
        ;;
      *)
        ;;
    esac
fi
