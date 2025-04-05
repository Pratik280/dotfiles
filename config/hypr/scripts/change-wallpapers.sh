#!/bin/bash

#export | grep HYPR
export XDG_RUNTIME_DIR=/run/user/1000

#echo $XDG_RUNTIME_DIR
export HYPRLAND_INSTANCE_SIGNATURE=0000000000000000000000000000000000000000_1743842625_1740816846

WALLPAPER_DIRECTORY=~/Pictures/wallpapers/fantasy

WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "HDMI-A-1,$WALLPAPER"

sleep 1

hyprctl hyprpaper unload unused

#* * * * * /home/pratik/dotfiles/config/hypr/scripts/change-wallpapers.sh >> /home/pratik/dotfiles/config/hypr/scripts/log.txt 2>&1
##*/3 * * * * /home/pratik/dotfiles/config/hypr/scripts/change-wallpapers.sh
