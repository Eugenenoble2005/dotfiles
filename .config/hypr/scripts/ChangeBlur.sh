#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "2" ]; then
	hyprctl keyword decoration:blur:size 0
	hyprctl keyword decoration:blur:passes 0
 	notify-send -e -u low -i "$notif" "No blur"
else
	hyprctl keyword decoration:blur:size 10
	hyprctl keyword decoration:blur:passes 2
  	notify-send -e -u low -i "$notif" "Normal blur"
fi
