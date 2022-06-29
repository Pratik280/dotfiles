#!/bin/sh
chosen=$(echo -e "[Cancel]\nRandom\nAbstract\nAnime\nDracula\nFantasy\nGame\nMisc\nNord\nPhoto-real" | rofi -dmenu -i)

if [[ $chosen = "Random" ]]; then
  nitrogen --random ~/Pictures/wallpapers/ --set-zoom-fill
elif [[ $chosen = "Abstract" ]]; then
  nitrogen --random ~/Pictures/wallpapers/abstract/ --set-zoom-fill
elif [[ $chosen = "Anime" ]]; then
  nitrogen --random ~/Pictures/wallpapers/anime/ --set-zoom-fill
elif [[ $chosen = "Dracula" ]]; then
  nitrogen --random ~/Pictures/wallpapers/dracula/ --set-zoom-fill
elif [[ $chosen = "Fantasy" ]]; then
  nitrogen --random ~/Pictures/wallpapers/fantasy/ --set-zoom-fill
elif [[ $chosen = "Game" ]]; then
  nitrogen --random ~/Pictures/wallpapers/game/ --set-zoom-fill
elif [[ $chosen = "Misc" ]]; then
  nitrogen --random ~/Pictures/wallpapers/misc/ --set-zoom-fill
elif [[ $chosen = "Nord" ]]; then
  nitrogen --random ~/Pictures/wallpapers/nord/ --set-zoom-fill
elif [[ $chosen = "Photo-real" ]]; then
  nitrogen --random ~/Pictures/wallpapers/photo-real/ --set-zoom-fill
fi
