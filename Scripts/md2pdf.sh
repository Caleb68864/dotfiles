#!/bin/bash
file="$1"
if [ -f $file ] && [ ! -z $file ]; then
    name="${file%%.*}"
    pandoc -s "$file" -o "$name.html" 
    wkhtmltopdf --keep-relative-links "$name.html" "$name.pdf"
    rm "$name.html"
    #sudo chmod 777 -R *
else
    if [ -z $file ]; then
        echo "No File Was Specified"
    else
        echo "$file Does Not Exist"
    fi
fi
