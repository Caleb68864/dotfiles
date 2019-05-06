#!/bin/bash
#ARRAY=$(tmux ls -F "#{session_name}: #{?session_attached,attached,not attached}")
#echo ${ARRAY[*]}
Main=$(tmux has-session -t Main)
nums=(2,3,4,5,6,7,8,9,10)
if $Main; then         
    echo "Main Session Exists"
    for i in $nums:
        e=$(tmux has-session -t $i)
        if $e; then
            st -e tmux new-session
        fi
else
    echo "Main Session Does Not Exists"         
    st -e attach-session -t Main
fi
