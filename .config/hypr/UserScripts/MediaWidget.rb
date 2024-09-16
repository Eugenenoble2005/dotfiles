isSpotify = `playerctl metadata`.split(" ")[0] == "spotify";
if ARGV[0] == "--is-spotify"
    puts isSpotify
end

case ARGV[0]
when "--artist"
    puts `playerctl metadata xesam:artist`
when "--title"
    puts `playerctl metadata xesam:title`
when "--arturl"
    puts `playerctl metadata mpris:artUrl`
end
