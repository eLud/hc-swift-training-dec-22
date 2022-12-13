//
//  Vinyl.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import Foundation

struct Vinyl: Equatable {
    enum Speed {
        case rpm33
        case rpm45
        case rpm78
    }

    let albumName: String
    let artist: String
    let releaseDate: Date
    let numberInSerie: Int?
    let titles: [String]
    var scratched: Bool
    let speed: Speed

    func play() {

    }
}
