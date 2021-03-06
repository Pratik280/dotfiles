#!/usr/bin/sh

# BROWSER="flatpak run org.chromium.Chromium"
BROWSER="flatpak run com.brave.Browser"
# BROWSER="brave-browser"

declare -a options=(
"quit"
"Scrimba Space tut - https://scrimba.com/learn/spacetravel/"
"odin project js - https://www.theodinproject.com/paths/full-stack-javascript/courses/javascript"
"javascript github concepts - https://github.com/leonardomso/33-js-concepts"
"You dont know JS - https://github.com/getify/You-Dont-Know-JS"
"mycodeschool DSA - https://www.youtube.com/watch?v=92S4zgXN17o&list=PL2_aWCzGMAwI3W_JlcBbtYTwiQSsOTa6P"
"Codewars - https://www.codewars.com/dashboard"
"College meet - https://meet.google.com/landing?authuser=1"
"College drive - https://drive.google.com/drive/u/1/my-drive"
"College classroom - https://classroom.google.com/u/1/h"
"College gmail - https://mail.google.com/mail/u/1/#inbox"
"Github Repos - https://github.com/Pratik280?tab=repositories"
"Github New Repo - https://github.com/new"
"gh js hard-parts - https://github.com/StevanCakic/js-hard-parts"
"Youtube Subscription - https://www.youtube.com/feed/subscriptions"
"Youtube Watch Later - https://www.youtube.com/playlist?list=WL"
"yt daily-dev - https://www.youtube.com/playlist?list=PLnQe65T2ABT-IfvcNrzzGmEa4YKUIsrOE"
"createapp - https://createapp.dev/webpack/no-library"
"caniuse - https://caniuse.com/"
"tailwindcss - https://tailwindcss.com/"
"vitejs - https://vitejs.dev/"
"parceljs - https://parceljs.org/"
"snowpack - https://www.snowpack.dev/"
"Twitch - https://www.twitch.tv/"
"MahaDBT - https://mahadbtmahait.gov.in/login/login"
"Spotify - https://open.spotify.com/"
"ProtonDB - https://www.protondb.com/"
"Reddit Saved - https://www.reddit.com/user/PratikChandlekar/saved/"
"Whatsapp - https://web.whatsapp.com/"
"Gmail - https://mail.google.com/mail/u/0/#inbox"
"GDrive - https://drive.google.com/drive/my-drive"
"READ - https://docs.google.com/document/d/1tWUOWUT0a9SXkAEfIwS0HGv4cArqWAMQhMndZebiz9A/edit#"
"Color Picker - https://www.google.com/search?q=color+picker&oq=color+picker&aqs=chrome.0.69i59j69i57.3312j0j3&sourceid=chrome&ie=UTF-8"
"Frontend Mentor - https://www.frontendmentor.io/profile/Pratik280"
"just the DOM - https://www.youtube.com/playlist?list=PLyuRouwmQCjlrOdLPmPMr04lARwMicfLe"
"completed projects - https://www.vanillajavascriptprojects.com/"
"code - https://github.com/john-smilga/javascript-basic-projects"
"Snapdrop - https://snapdrop.net/"
"r/Wallpaper - https://www.reddit.com/r/wallpaper/"
"Wallhaven - https://wallhaven.cc/"
"alphacoders - https://wall.alphacoders.com/"
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
