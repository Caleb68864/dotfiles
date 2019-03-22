gog="$HOME/GOG Games/"
if [ -d "$gog" ]; then
    games=$(du --max-depth=1 "$gog" | awk '{for (i=2; i<NF; i++) print $i " " $NF}' | rofi -dmenu)
    #echo $games
    command=$(du -a --max-depth=1 "$games" | awk '{for (i=2; i<NF; i++) print $i " " $NF}' | rofi -dmenu)
    #echo $command

    if [ -d "$command" ]; then
        st -e ranger "$command"
    elif [ ${command: -4} == ".pdf" ]; then
        zathura "$command"
    elif [ ${command: -4} == ".txt" ]; then
        vim "$command"
    else    
        "$command"
    fi
else
    echo "$gog Does Not Exists"
fi
