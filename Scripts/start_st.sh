#!/bin/bash
#ARRAY=$(tmux ls -F "#{session_name}: #{?session_attached,attached,not attached}")
#echo ${ARRAY[*]}
Main=$(tmux has-session -t Main)
if $Main; then         
    echo "Main Session Exists"         
else
    echo "Main Session Does Not Exists"         

fi
