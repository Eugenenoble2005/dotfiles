wallust run "$1"

if [[ "$i" != *.gif  ]]; then
  #only move file if it is not a gif
  cp "$1" ~/.config/hypr/wallpaper_effects/.wallpaper_current
fi

~/.config/hypr/scripts/Refresh.sh
