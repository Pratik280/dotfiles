#!/bin/bash
~/.config/polybar/launch.sh &
lxpolkit &
exec sxhkd &
nitrogen --restore &
picom &
xmodmap -e "pointer = 1 2 3" &
noisetorch &
