#!/bin/bash
# BROWSER="flatpak run org.chromium.Chromium"
# BROWSER="flatpak run com.microsoft.Edge"
# BROWSER="flatpak run org.mozilla.firefox"
BROWSER="flatpak run com.brave.Browser"
# BROWSER="brave-browser"

declare -a options=(
"quit"
"Github Repos - https://github.com/Pratik280?tab=repositories"
"Zaney dots - https://gitlab.com/Zaney/dots"
"Linux Cast dots - https://gitlab.com/thelinuxcast/my-dots"
"Youtube Subscription - https://www.youtube.com/feed/subscriptions"
"Google meet - https://meet.google.com/landing?authuser=0"
"Dotfiles Github - https://github.com/Pratik280/dotfiles"
"Youtube Watch Later - https://www.youtube.com/playlist?list=WL"
"yt daily-dev - https://www.youtube.com/playlist?list=PLnQe65T2ABT-IfvcNrzzGmEa4YKUIsrOE"
"Twitch - https://www.twitch.tv/"
"MahaDBT - https://mahadbtmahait.gov.in/login/login"
"ProtonDB - https://www.protondb.com/"
"Reddit Saved - https://www.reddit.com/user/PratikChandlekar/saved/"
"Whatsapp - https://web.whatsapp.com/"
"Gmail - https://mail.google.com/mail/u/0/#inbox"
"GDrive - https://drive.google.com/drive/my-drive"
"Color Picker - https://www.google.com/search?q=color+picker&oq=color+picker&aqs=chrome.0.69i59j69i57.3312j0j3&sourceid=chrome&ie=UTF-8"
"Snapdrop - https://snapdrop.net/"
"r/Wallpaper - https://www.reddit.com/r/wallpaper/"
"Wallhaven - https://wallhaven.cc/"
"alphacoders - https://wall.alphacoders.com/"
)

#choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Bookmarks')
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Bookmarks')


if [[ "$choice" == quit ]]; then
	echo "Program Terminated." && exit 1
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$BROWSER "$cfg"
else
	echo "Program Terminated." && exit 1
fi
