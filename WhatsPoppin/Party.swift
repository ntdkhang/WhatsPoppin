//
//  Party.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import Foundation

struct Party: Identifiable {
    var id: UUID = UUID()
    var name: String
    var imageURLString: String
    var price: Double
    var startDate: Date
    var endDate: Date?
}


extension Party {
    static var urls: [String] = [
        "https://static.wikia.nocookie.net/rickandmorty/images/3/3e/Rick-and-morty-wallpaper.jpg/revision/latest/scale-to-width-down/1000?cb=20171014062009",
        "https://static.wikia.nocookie.net/rickandmorty/images/b/bd/Rick%27s_ride.png/revision/latest/scale-to-width-down/1000?cb=20190428214457",
        "https://static.wikia.nocookie.net/rickandmorty/images/1/19/S4e2_peaceful_rick.jpg/revision/latest/scale-to-width-down/1000?cb=20191118073705",
        "https://static.wikia.nocookie.net/rickandmorty/images/f/fd/S3e4_dabbing_im_dying.png/revision/latest/scale-to-width-down/1000?cb=20170820103301",
        "https://static.wikia.nocookie.net/rickandmorty/images/d/d3/Anatomy_Park_7.png/revision/latest/scale-to-width-down/1000?cb=20160913082442",
        "https://static.wikia.nocookie.net/rickandmorty/images/8/85/S4e2_robot_wars.png/revision/latest/scale-to-width-down/1000?cb=20191122033400",
        "https://static.wikia.nocookie.net/rickandmorty/images/4/46/S4e2_2019-11-21-21h11m59s181.png/revision/latest/scale-to-width-down/1000?cb=20191122022714",
        "https://static.wikia.nocookie.net/rickandmorty/images/c/c5/RICK_MORTY_BILLBOARD_72.jpg/revision/latest/scale-to-width-down/1000?cb=20171014061949",
        "https://static.wikia.nocookie.net/rickandmorty/images/4/49/Total_Rickall.png/revision/latest?cb=20160920093829"
    ]
}
