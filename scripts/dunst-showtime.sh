#!/bin/sh
time=$(date '+%I:%M %p')
date=$(date '+%A %d %B %Y')
dunstify " $date   $time" -t 2000

#dunstify " $(date '+%A %d %B %Y')  $(date '+%I:%M %p') $time" -t 2000
