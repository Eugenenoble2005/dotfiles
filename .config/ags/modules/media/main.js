const mpris = await Service.import("mpris")
const players = mpris.bind("players")

function Player(player){
    return Widget.Box({
        vertical:true,
        children:[
            Widget.Box({
                class_name:"image_box",
                height_request:300,
                visible: player.bind("name") == "spotify",
                width_request:300,
                css: player.bind("cover_path").transform(p => `
                    background-image: url('${p}');
                `),
            }),
            Widget.Box({
                vertical:true,
                css:"background:rgba(0,0,0,0.5)",
                children:[
                    Widget.Label({
                        label: player.bind("track_artists").transform(a => a.join(", ")),
                        class_name:"media_text",
                        truncate:"end",
                        
                    }),
                    Widget.Label({
                       label: player.bind("track_title"),
                       class_name:"media_text",
                       truncate:"end"
                    }),            
                    Widget.Slider({
                        class_name: "position",
                        draw_value: false,
                        on_change: ({ value }) => player.position = value * player.length,
                        visible: player.bind("length").as(l => l > 0),
                        setup: self => {
                            function update() {
                                const value = player.position / player.length
                                self.value = value > 0 ? value : 0
                            }
                            self.hook(player, update)
                            self.hook(player, update, "position")
                            self.poll(1000, update)
                        },
                    })
                ]
            })
        ]
    })
}
function  MediaBox(){
    players.as(p=>console.log(p.length));
    return Widget.Box({
        margin_left:20,
        visible: players.as(p => p.length > 0),
        children: players.as(p => p.slice(0,1).map(Player)),
    });
}
export function Media(){
    return Widget.Window({
        child:MediaBox(),
        name:"media",
        anchor: ["bottom","left"],
        layer:"background"
    })
}
