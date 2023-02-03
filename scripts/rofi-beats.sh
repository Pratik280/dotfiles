#!/bin/sh

# add more args here according to preference
ARGS="--volume=60"

notification(){
# change the icon to whatever you want. Make sure your notification server 
# supports it and already configured.

# Now it will receive argument so the user can rename the radio title
# to whatever they want

	notify-send "Playing now: " "$@" --icon=media-tape
}

menu(){
	printf "1. Lofi Girl\n"
	printf "2. Chillhop\n"
	printf "3. Box Lofi\n"
	printf "4. The Bootleg Boy\n"
	printf "5. Radio Spinner\n"
	printf "6. SmoothChill\n"
  printf "7. Lofi girl relax 24/7\n"
  printf "8. Lofi girl chill 24/7\n"
  printf "9. Coffee Shop Radio lofi hip hop\n"
  printf "10. Chill lofi Code\n"
  printf "11. Jazzy Lofi\n"
  printf "12. Jazz Piano\n"
  printf "13. Rain Piano\n"
  printf "14. Lofi Girl Album\n"
  printf "15. Lofi Girl Compilations\n"
  printf "16. Anime Lofi\n"
  printf "17. My Lofi\n"
  printf "18. Deathnote theme bg\n"
  printf "19. To Give a Marionette Life Lofi\n"
  printf "20. Hyori Ittai Lofi\n"
  printf "21. You say run\n"
  printf "22. You say run lofi\n"
  printf "23. Demon Slayer - Survive and Get the Blade lofi\n"
  printf "24. Sigma Grindset\n"
  printf "25. HxH Departure Lofi\n"
  printf "26. You too can become a hero Lofi\n"
  printf "27. MHA main theme Lofi\n"
  printf "28. Can you feel sigma\n"
}


main() {
	choice=$(menu | rofi -dmenu | cut -d. -f1)

	case $choice in
		1)
			notification "Lofi Girl ☕️🎶";
            URL="https://play.streamafrica.net/lofiradio"
			break
			;;
		2)
			notification "Chillhop ☕️🎶";
            URL="http://stream.zeno.fm/fyn8eh3h5f8uv"
			break
			;;
		3)
			notification "Box Lofi ☕️🎶";
            URL="http://stream.zeno.fm/f3wvbbqmdg8uv"
			break
			;;
		4)
			notification "The Bootleg Boy ☕️🎶";
            URL="http://stream.zeno.fm/0r0xa792kwzuv"
			break
			;;
		5)
			notification "Radio Spinner ☕️🎶";
            URL="https://live.radiospinner.com/lofi-hip-hop-64"
			break
			;;
		6)
			notification "SmoothChill ☕️🎶";
            URL="https://media-ssl.musicradio.com/SmoothChill"
      ;;
		7)
			notification "Lofi girl relax 24/7";
            URL="https://youtu.be/5qap5aO4i9A"
      ;;
		8)
			notification "Lofi girl chill 24/7";
            URL="https://youtu.be/DWcJFNfaw9c"
      ;;
		9)
			notification "Coffee Shop Radio lofi hip hop";
            URL="https://youtu.be/-5KAN9_CzSA"
      ;;
		10)
			notification "Chill lofi Code";
            URL="https://youtu.be/PY8f1Z3nARo"
      ;;
		11)
			notification "Jazzy Lofi";
            URL="https://youtu.be/5yx6BWlEVcY"
      ;;
		12)
			notification "Jazz Piano";
            URL="https://youtu.be/6uddGul0oAc"
      ;;
		13)
			notification "Rain Piano";
            URL="https://youtu.be/Eo5RPdTt0e0"
      ;;
		14)
			notification "Lofi Girl Albums";
            URL="https://youtube.com/playlist?list=PL6NdkXsPL07IOu1AZ2Y2lGNYfjDStyT6O"
      ;;
		15)
			notification "Lofi Girl Compilations";
            URL="https://youtube.com/playlist?list=PL6NdkXsPL07KN01gH2vucrHCEyyNmVEx4"
      ;;
		16)
			notification "Anime Lofi";
            URL="https://youtube.com/playlist?list=PLnQe65T2ABT93uUe8skxyDOGFzSavFV5B"
      ;;
		17)
			notification "My Lofi";
            URL="https://youtube.com/playlist?list=PLnQe65T2ABT-VYTcx2mPxy8x4XZLEO-D6"
			;;
		18)
			notification "Deathnote theme bg\n";
            URL="https://youtube.com/playlist?list=PLnQe65T2ABT-KGMWAS5VttWwOv2UHvDaL"
      ;;
		19)
			notification "To Give a Marionette Life Lofi"; 
            # URL="https://youtu.be/RpgvdkeBDJE" 
            URL="https://music.youtube.com/watch?v=Ru1yVvEy0pM&feature=share" 
      ;;
		20)
			notification "Hyori Ittai Lofi";
            URL="https://youtu.be/UB3iQEgSn0I"
      ;;
		21)
			notification "You say run";
            URL="https://youtu.be/iYZIUtDAFIw"
      ;;
		22)
			notification "You say run lofi";
            URL="https://youtu.be/8HJykNfvtec"
      ;;
		23)
			notification "Demon Slayer - Survive and Get the Blade Lofi";
            URL="https://youtu.be/HfJnB8sekZ0"
      ;;
		24)
			notification "Sigma Grindset";
            URL="https://youtu.be/1-emQo-7O3Y"
      ;;
		25)
			notification "HxH Departure Lofi";
            URL="https://youtu.be/MDqvMbq8oVg"
      ;;
		26)
			notification "You too can become a hero lofi";
            URL="https://youtu.be/DpibI5O9NC4"
			;;
		27)
			notification "MHA main theme lofi";
            URL="https://youtu.be/zoqSMwRAZsg"
      ;;
		28)
			notification "Can you feel Sigma";
            URL="https://youtu.be/6pDCeZI2vl0"
			break
			;;
	esac
    # run mpv with args and selected url
    # added title arg to make sure the pkill command kills only this instance of mpv
    # mpv $ARGS --title="radio-mpv" $URL --no-video --shuffle --loop
    flatpak run io.mpv.Mpv $ARGS --title="radio-mpv" $URL --no-video --shuffle --loop
}

pkill -f radio-mpv || main
