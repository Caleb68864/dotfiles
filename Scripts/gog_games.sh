#games=$(du --max-depth=1 ~/GOG\ Games/ | awk '{print $2" "$3}' | fzf)
#games=$(du --max-depth=1 ~/GOG\ Games/ | awk '{for (i=2; i<NF; i++) print $i " " $NF}' | fzf)
games=$(du --max-depth=1 ~/GOG\ Games/ | awk '{for (i=2; i<NF; i++) print $i " " $NF}' | rofi -dmenu)
echo $games
command=$(du -a --max-depth=1 "$games" | awk '{for (i=2; i<NF; i++) print $i " " $NF}' | rofi -dmenu)
#echo $command
"$command"
