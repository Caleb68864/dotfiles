#!/bin/bash
sourcedir=$1
destdir=$2

iregex=".*\.\(jpeg\|jpg\|png\)"

find "$sourcedir" -type f -iregex "$iregex" | while read file ; do
    #cp -v "$file" "$d/$(md5sum "$file" | cut -d" " -f1).${file##*.}"
    #cp -v "$file" "$d/$(ls -i "$file" | cut -d" " -f1).${file##*.}"
    cp -v "$file" "$destdir/$(basename "$file")" 
done


