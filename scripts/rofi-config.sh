#!/usr/bin/env bash

DMEDITOR="kitty -e nvim"

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"quit"
"bash - $HOME/dotfiles/.bashrc"
"bash - $HOME/dotfiles/README.md"
"i3 - $HOME/dotfiles/config/i3/config"
"Hyprland - $HOME/dotfiles/config/hypr/hyprlandd.conf"
"autostart - $HOME/dotfiles/config/i3/autostart.sh"
"polybar - $HOME/dotfiles/config/polybar/config"
"nvim - $HOME/.config/nvim"
"kitty - $HOME/dotfiles/config/kitty/kitty.conf"
"rofi - $HOME/dotfiles/config/rofi/config.rasi"
"neofetch - $HOME/dotfiles/config/neofetch/config.conf"
"sxhkd - $HOME/dotfiles/config/sxhkd/sxhkdrc"
"scripts - $HOME/dotfiles/scripts"
"picom - $HOME/dotfiles/config/picom/picom.conf"
"ranger - $HOME/dotfiles/config/ranger/rc.conf"
"starship - $HOME/dotfiles/starship.toml"
"qtile - $HOME/dotfiles/config/qtile/config.py"
"awesome - $HOME/dotfiles/config/awesome/rc.lua"
"bspwm - $HOME/dotfiles/config/bspwm/bspwmrc"
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
