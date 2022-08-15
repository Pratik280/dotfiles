#!/bin/sh

# uptime=$(uptime -p)
# echo " $uptime"
# upt="$(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/, / /g')"
# echo -e "$upt"
echo $(uptime) | sed 's/^.\+up\ \+\([^,]*\).*/\1/g'

