if pgrep -x "cpulimit" > /dev/null 
then
	killall cpulimit
	notify-send "GIF wallpaper resumed"
else
	notify-send "GIF wallpaper paused"
	cpulimit -e swww-daemon -l 0
fi
