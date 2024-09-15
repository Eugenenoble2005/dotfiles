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
                        class_name:"media_text"
                        
                    }),
                    Widget.Label({
                       label: player.bind("track_title"),
                       class_name:"media_text"
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