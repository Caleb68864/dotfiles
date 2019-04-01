folder="$1"
oc="$2"
if [ -z $oc ]; then
    oc="rofi -dmenu"    
fi
if [ -d "$folder" ]; then
    #echo $(du --max-depth=1 "$folder" | awk '{for (i=2; i<NF; i++) print $i " " $NF}')
    #echo $(du --max-depth=1 "$folder")
    #echo $(du --max-depth=1 "$folder" | awk '{print (NF>2) ? $2 " " $NF : $2}')
    #echo $(ls "$folder" | awk '{print (NF>2) ? $2 " " $NF : $2}')
    #echo $(ls "$folder" | awk '{print }')
    #contents=$(du -a --max-depth=1 "$folder" | awk '{print (NF>2) ? $2 " " $NF : $2}' | rofi -dmenu)
    #echo $contents
    #if [ -n "$contents" ]; then
    #command=$(du -a --max-depth=1 "$contents" | awk '{print (NF>2) ? $2 " " $NF : $2}' | rofi -dmenu)
    command=$(du -a --max-depth=1 "$folder" | awk '{print (NF>2) ? $2 " " $NF : $2}' | $oc)
    #echo $command
    if [ -n "$command" ]; then
        if [ -d "$command" ]; then
            #st -e ranger "$command"
            #echo $command
            $HOME/dotfiles/Scripts/rofi_dir.sh "$command" "$oc"
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
