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
    let numberInSerie: Int
    let titles: [String]
    var scratched: Bool
    let speed: Speed

    func play() {

    }
}

class Library {
    var vinyls: [Vinyl] = []

    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) {
        if let index = vinyls.firstIndex(of: vinyl) {
            vinyls.remove(at: index)
        }
    }
}

let lib = Library()
let album1 = Vinyl(albumName: "", artist: "", releaseDate: .now, numberInSerie: 0, titles: [], scratched: true, speed: .rpm33)

lib.add(album1)
