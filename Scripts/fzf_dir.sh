folder="$1"
if [ -d "$folder" ]; then
    command=$(du -a --max-depth=1 "$folder" | awk '{print (NF>2) ? $2 " " $NF : $2}' | fzf)
    #echo $command
    if [ -n "$command" ]; then
        if [ -d "$command" ]; then
            #st -e ranger "$command"
            #echo $command
            $HOME/dotfiles/Scripts/rofi_dir.sh "$command"
        elif [ ${command: -4} == ".pdf" ]; then
            zathura "$command"
        elif [ ${command: -4} == ".txt" ]; then
             vim "$command"
        elif [ ${command: -4} == ".mp4" ]; then
            mpv "$command"
        elif [ ${command: -5} == ".webm" ]; then
            mpv "$command"
        elif [ ${command: -4} == ".sh" ]; then
            "$command"
        else    
           "$command"
        fi
    fi
    #fi
else
    echo "$folder Does Not Exists"
fi
