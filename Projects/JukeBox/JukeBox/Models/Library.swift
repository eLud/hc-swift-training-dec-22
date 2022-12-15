//
//  Library.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import Foundation

class Library: ObservableObject {

    @Published var vinyls: [Vinyl] = []

    static func demoLibrary() -> Library {
        let lib = Library()
        lib.add(Vinyl(albumName: "Demo Vinyl", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: true, speed: .rpm45))
        return lib
    }
}

// MARK: - Data management
extension Library {
    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) -> Vinyl? {
        if let index = vinyls.firstIndex(of: vinyl) {
            let removed = vinyls.remove(at: index)
            return removed
        }
        return nil
    }

}

extension Library: Equatable {
    static func == (lhs: Library, rhs: Library) -> Bool {
        lhs.vinyls == rhs.vinyls
    }
}
