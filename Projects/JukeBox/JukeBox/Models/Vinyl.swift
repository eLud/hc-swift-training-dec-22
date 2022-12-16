//
//  Vinyl.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import Foundation

protocol MusicHolder {
    var albumName: String { get }
    var artist: String { get }
    var releaseDate: Date { get }
    var numberInSerie: Int? { get }
    var titles: [String] { get }
    var scratched: Bool { get set }

    func play()
}

extension MusicHolder {
    func play() {
        print("I'm playing the album \(albumName)")
    }
}

struct CompactDisc: MusicHolder {
    let albumName: String
    let artist: String
    let releaseDate: Date
    let numberInSerie: Int?
    let titles: [String]
    var scratched: Bool
}

struct Vinyl: Equatable, MusicHolder, Identifiable, Codable {

    enum Speed: Int, CaseIterable, Identifiable, Codable {
        case rpm33 = 33
        case rpm45 = 45
        case rpm78 = 78

        var title: String {
            "\(rawValue) trs"
        }

        var id: Speed {
            self
        }
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

    let id: UUID = UUID()

// Auto implemented by we are in a struct with only Equatable properties
//    static func == (lhs: Vinyl, rhs: Vinyl) -> Bool {
//        lhs.albumName == rhs.albumName &&
//        lhs.artist == rhs.artist
//    }
}
