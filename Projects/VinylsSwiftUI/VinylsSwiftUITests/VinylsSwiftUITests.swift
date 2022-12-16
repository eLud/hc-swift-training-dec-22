//
//  VinylsSwiftUITests.swift
//  VinylsSwiftUITests
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import XCTest
@testable import VinylsSwiftUI

final class VinylsSwiftUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddVinyl() throws {
        let lib = Library()
        let vinyl = Vinyl(albumName: "Vinyl1", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: false, speed: .rpm33)

        XCTAssertEqual(lib.vinyls.count, 0)
        lib.add(vinyl)
        XCTAssertEqual(lib.vinyls.count, 1)
    }

    func testRemoveVinyl() throws {
        let lib = Library()
        let vinyl = Vinyl(albumName: "Vinyl1", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: false, speed: .rpm33)
        lib.add(vinyl)
        lib.remove(vinyl)
        XCTAssertEqual(lib.vinyls.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let lib = Library()
        let vinyl = Vinyl(albumName: "Vinyl1", artist: "", releaseDate: .now, numberInSerie: nil, titles: [], scratched: false, speed: .rpm33)
        measure {
            lib.add(vinyl)
        }
    }

}
