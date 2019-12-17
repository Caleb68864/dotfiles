#!/bin/bash
sudo blkid
device=$(blkid | awk '{print substr($1, 0, length($1) - 1)}' | fzf)

#echo $device

if [ ! -z "$device" ]
then
    confirm=false
    while [ $confirm == false ]
    do
        read -p "Enter Camera Name: " name
        read -p "Is $name Correct? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || confirm=false
    done
    d=$(date +%F_%H%M)_$name
    year=$(date +%Y)

    temp_dir=${d}_temp

    if [ ! -d $temp_dir ]
    then
        mkdir $temp_dir
    fi

    if [ ! -d $d ]
    then
        mkdir $d
    fi

    if [ -d $temp_dir ]
    then
        sudo mount $device $temp_dir
    fi

    ~/dotfiles/Scripts/extract_pics.sh $temp_dir $d
    
    if [ ! -d $year ]
    then
        mkdir $year
    fi

    mv $d $year
    #rclone copy --max-age 24h --no-traverse -P $year "GDrive:Game Cam/$year" 

    sudo umount $temp_dir
    rm -r $temp_dir
fi

