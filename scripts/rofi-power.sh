#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it

chosen=$(echo -e "[Cancel]\nLock\nLogout\nShutdown\nReboot\nSuspend\nHibernate\nSuspend-then-hibernate" | rofi -dmenu -i)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "Logout" ]]; then
	jwm -exit
elif [[ $chosen = "Lock" ]]; then
	xflock4
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
elif [[ $chosen = "Suspend" ]]; then
	# systemctl suspend && slock
	systemctl suspend
elif [[ $chosen = "Hibernate" ]]; then
	# systemctl hibernate && slock
	systemctl hibernate
elif [[ $chosen = "Suspend-then-hibernate" ]]; then
	# systemctl suspend-then-hibernate && slock
	systemctl suspend-then-hibernate
fi




