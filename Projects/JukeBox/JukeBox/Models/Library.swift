//
//  Library.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import Foundation

class Library: ObservableObject {

    @Published var vinyls: [Vinyl]

    init() {
        vinyls = []
        restore()
    }
    static func demoLibrary() -> Library {
        let lib = Library()
        lib.add(Vinyl(albumName: "Demo Vinyl", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: true, speed: .rpm45))
        return lib
    }

    @discardableResult
    func save() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        if let data = try? encoder.encode(vinyls) {
            print(String(data: data, encoding: .utf8)!)

            let fileManager = FileManager.default
            if let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                print(url)
                let fileURL = url.appendingPathComponent("vinyls.json")
                try? data.write(to: fileURL)
            }
            return data
        }
        return nil
    }

    func restore() {
        let fileManager = FileManager.default
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fileURL = url.appendingPathComponent("vinyls.json")
        guard let data = try? Data(contentsOf: fileURL) else { return }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let vinyls = try decoder.decode([Vinyl].self, from: data)
            self.vinyls = vinyls
        } catch {
            print(error)
        }
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
