#!/bin/bash
chosen=$(echo -e "[Cancel]\nRandom\nAbstract\nAnime\nDracula\nFantasy\nGame\nMisc\nNord\nCatppuccin\nPhoto-real" | rofi -dmenu -i)

if [[ $chosen = "Random" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Abstract" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/abstract/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Anime" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/anime/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Dracula" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/dracula/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Fantasy" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/fantasy/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Game" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/game/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Misc" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/misc/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Nord" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/nord/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Catppuccin" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/catppuccin/. -type f | shuf -n1) -m fill
elif [[ $chosen = "Photo-real" ]]; then
  swaybg -i $(find /home/pratik/Pictures/wallpapers/photo-real/. -type f | shuf -n1) -m fill
fi
