#!/bin/bash
mpv --ytdl-format=bestaudio/best --no-video --shuffle --loop "$(xclip -o -sel c)"

