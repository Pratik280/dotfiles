#!/usr/bin/env bash

DMEDITOR="nemo"

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"Projects - $HOME/100daysofcode"
"dotfiles- $HOME/dotfiles"
"00MAIN- $HOME/00MAIN"
"Downloads- $HOME/Downloads"
"Pictures- $HOME/Pictures"
"Applications- $HOME/Applications"
"quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i  20 -p 'Edit config:')

# What to do when/if we choose 'quit'.
if [[ "$choice" == "quit" ]]; then
    echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$DMEDITOR "$cfg"

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 1
fi
