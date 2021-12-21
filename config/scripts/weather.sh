#!/usr/bin/env bash
# width of window
W=250
# City
C=Malang

prin_weather() {
    printf '\n\n   %s Now \n\n' $C
    curl -s "wttr.in/$C?0QT"
    printf '\n'
}

eval $(xdotool getdisplaygeometry --shell)
prin_weather | dzen2 -p -l 9 \
    -w $W -x $((WIDTH/2-W/2)) -y 18 \
    -fn 'Fira Code:bold:size=8' \
    -e 'onstart=hide,togglecollapse;button1=exit;button3=exit'
