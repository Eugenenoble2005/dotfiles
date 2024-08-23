result=$(hyprshade current)
echo $result
if [[ $result == "blue-light-filter" ]]; then
  notify-send "Night Light Off"
  hyprshade off
else
  hyprshade on blue-light-filter
  notify-send "Night Light On"
fi 
