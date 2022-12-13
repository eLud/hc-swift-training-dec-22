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

class Library {
    var vinyls: [Vinyl] = []

    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) -> Vinyl? {
        if let index = vinyls.firstIndex(of: vinyl) {
            return vinyls.remove(at: index)
        }
        return nil
    }
}

let lib = Library()
let album1 = Vinyl(albumName: "", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: true, speed: .rpm33)

lib.add(album1)

let numberInSeries: Bool? = lib.remove(album1)?.numberInSerie?.isMultiple(of: 2)

var anOptionalInt: Int? = nil
anOptionalInt = 6

// nil coalescing operator (valeur par défaut si nil)
let result = (anOptionalInt ?? 0) * 2

//let result2 = anOptionalInt! * 2

if let anOptionalInt = anOptionalInt {
    2 * anOptionalInt
} else {
    print("No value")
}

if let anOptionalInt {
    anOptionalInt * 2
}
