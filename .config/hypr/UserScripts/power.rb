power = `upower -d | grep \"percentage\" -m 1`
puts power.split(":")[1].strip!

