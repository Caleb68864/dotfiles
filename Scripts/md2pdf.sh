#!/bin/bash
file="$1"
sudo chmod 777 -R "$file"
if [ -f "$file" ] && [ -n "$file" ]; then
    name="${file%%.*}"
    #pandoc --metadata title="$name" -T "$name"  -s "$file" -o "$name.html"  
    #markdown -b $file -f links,image,html,header > "$name.html"
    #sudo chmod 777 -R "$name.html"
    markdown "$file" > "$name.html"
    if [ -f "$name.html" ]; then
        wkhtmltopdf --title "$name" --keep-relative-links -B 0 -L 0 -R 0 -T 0 -q "$name.html" "$name.pdf" 
        rm "$name.html"   
    fi
    #sudo chmod 777 -R *
else
    if [ -z "$file" ]; then
        echo "No File Was Specified"
    else
        echo "$file Does Not Exist"
    fi
fi

