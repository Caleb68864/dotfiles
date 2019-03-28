#!/bin/bash
file="$1"
if [ -f "$file" ] && [ -n "$file" ]; then
    name="${file%%.*}"
    pandoc -s "$file" -o "$name.html"  
    if [ -f "$name.html" ]; then
        wkhtmltopdf --keep-relative-links -q "$name.html" "$name.pdf" 
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
