home = ENV["HOME"];
waybar_styles = home + "/.config/waybar/style/"
waybar_style = home + "/.config/waybar/style.css"
scripts_dir = home + "/.config/hypr/scripts/"
styles = Dir["#{waybar_styles}/*.css"]
random_index = rand(0..styles.length()-1)
selected_style = styles[random_index]
#create symlink
puts waybar_style
`ln -sf \"#{selected_style}\" \"#{waybar_style}\"`
#reload waybar if needed
`pkill waybar && sleep 0.5`

#`#{scripts_dir}Refresh.sh &`
