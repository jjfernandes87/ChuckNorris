//
//  SearchUITests.swift
//  FactsUITests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import XCTest

class SearchUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShowSearch() {
        let app = XCUIApplication()
        app.navigationBars["CHUCK NORRIS FACTS"].buttons["Search"].tap()
        XCTAssertTrue(app.navigationBars["Facts.SearchView"].buttons["Cancel"].exists, "did not show content")
        snapshot("4Search")
    }
    
    func testShowTagCloud() {
        let app = XCUIApplication()
        app.navigationBars["CHUCK NORRIS FACTS"].buttons["Search"].tap()
        XCTAssertTrue(app.staticTexts["Sugestões"].exists, "did not show categories")
    }
    
    func testCancelButton() {
        let app = XCUIApplication()
        app.navigationBars["CHUCK NORRIS FACTS"].buttons["Search"].tap()
        app.navigationBars["Facts.SearchView"].buttons["Cancel"].tap()
        XCTAssertTrue(app.navigationBars["CHUCK NORRIS FACTS"].exists, "did not dismiss controller")
    }
    
    func testSearch() {
        let app = XCUIApplication()
        app.navigationBars["CHUCK NORRIS FACTS"].buttons["Search"].tap()
        
        self.tapKeyboard("M", app: app)
        self.tapKeyboard("u", app: app)
        self.tapKeyboard("s", app: app)
        self.tapKeyboard("i", app: app)
        self.tapKeyboard("c", app: app)
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.navigationBars["CHUCK NORRIS FACTS"].buttons["Search"].tap()
        XCTAssertTrue(app.staticTexts["Music"].exists, "did not show last search")
    }

}

extension SearchUITests {
    func tapKeyboard(_ key: String, app: XCUIApplication) {
        let keyboardKey = app.keys[key]
        keyboardKey.tap()
    }
}
