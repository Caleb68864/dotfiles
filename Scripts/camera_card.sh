#!/bin/bash
device=$(sudo blkid | awk '{print substr($1, 0, length($1) - 1)}' | fzf)

#echo $device

if [ ! -z "$device" ]
then
    d=$(date +%F_%H%M)
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
    rclone copy $d "GDrive:Game Cam/$year/$d" -P

    sudo umount $temp_dir
    rm -r $temp_dir
fi

