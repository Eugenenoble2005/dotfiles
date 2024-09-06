
home = ENV["HOME"];
waybar_configs = home + "/.config/waybar/configs/"
waybar_config = home + "/.config/waybar/config"
scripts_dir = home + "/.config/hypr/scripts/"
configs = Dir["#{waybar_configs}/*"]
random_index = rand(0..configs.length()-1)
selected_config = configs[random_index]
#create symlink
`ln -sf \"#{selected_config}\" \"#{waybar_config}\"`
#reload waybar if needed
`pkill waybar && sleep 0.5`

