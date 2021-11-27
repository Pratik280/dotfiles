#!/usr/bin/sh

BROWSER="brave"

declare -a options=(
"quit"
"Youtube Subscription - https://www.youtube.com/feed/subscriptions"
"Youtube Watch Later - https://www.youtube.com/playlist?list=WL"
"Twitch - https://www.twitch.tv/"
"READ - https://docs.google.com/document/d/1tWUOWUT0a9SXkAEfIwS0HGv4cArqWAMQhMndZebiz9A/edit#"
"Gmail - https://mail.google.com/mail/u/0/#inbox"
"GDrive - https://drive.google.com/drive/my-drive"
"Color Picker - https://www.google.com/search?q=color+picker&oq=color+picker&aqs=chrome.0.69i59j69i57.3312j0j3&sourceid=chrome&ie=UTF-8"
"Github Repos - https://github.com/Pratik280?tab=repositories"
"Frontend Mentor - https://www.frontendmentor.io/profile/Pratik280"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Bookmarks')


if [[ "$choice" == quit ]]; then
	echo "Program Terminated." && exit 1
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$BROWSER "$cfg"
else
	echo "Program Terminated." && exit 1
fi
