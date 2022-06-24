#!/bin/bash
~/.config/polybar/launch.sh &
lxpolkit &
exec sxhkd &
nitrogen --restore &
# picom --transparent-clipping -b --config ~/.config/picom.conf &
# picom --transparent-clipping -b &
picom &
xmodmap -e "pointer = 1 2 3" &
killall noisetorch &
i3-msg 'workspace 9:Web; exec noisetorch' 
# killall pavucontrol &
# i3-msg 'workspace 1:Web; exec pavucontrol'
# noisetorch &
