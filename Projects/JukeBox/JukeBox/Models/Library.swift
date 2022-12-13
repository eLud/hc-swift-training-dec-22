//
//  Library.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import Foundation

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
