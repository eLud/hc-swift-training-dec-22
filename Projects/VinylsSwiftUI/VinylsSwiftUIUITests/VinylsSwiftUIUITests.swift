//
//  VinylsSwiftUIUITests.swift
//  VinylsSwiftUIUITests
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import XCTest

final class VinylsSwiftUIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.tabBars.firstMatch.exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddVinyl() {

        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Vinyls"]/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Add\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let collectionViewsQuery = app.collectionViews
        let albumName = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Album name"]/*[[".cells.textFields[\"Album name\"]",".textFields[\"Album name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        albumName.tap()

        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Save"]/*[[".cells.buttons[\"Save\"]",".buttons[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
