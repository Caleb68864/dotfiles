#!/bin/bash
file="$1"
if [ -f "$file" ] && [ -n "$file" ]; then
    name="${file%%.*}"
    #pandoc --metadata title="$name" -T "$name"  -s "$file" -o "$name.html"  
    #markdown -b $file -f links,image,html,header > "$name.html"
    markdown $file > "$name.html"
    if [ -f "$name.html" ]; then
        wkhtmltopdf --title "$name" --keep-relative-links -q "$name.html" "$name.pdf" 
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

