//
//  FactsUITests.swift
//  FactsUITests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import XCTest

class FactsUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLaunchApp() {
        let app = XCUIApplication()
        XCTAssertTrue(app.navigationBars["CHUCK NORRIS FACTS"].exists, "did not show content")
        snapshot("1Home")
    }
    
    func testFactsCard() {
        let app = XCUIApplication()
        let text = "All Chuck Norris facts should be told in a respectful whisper, whilst laying one's palms and forehead on the floor."
        XCTAssertTrue(app.staticTexts[text].exists, "did not show content")
    }
    
    func testDetailFact() {
        let app = XCUIApplication()
        app.tables.cells.element(boundBy: 1).tap()
        
        let text = "All the religions"
        XCTAssertTrue(app.tables.cells.staticTexts[text].exists, "did not show content")
        snapshot("2Detail")
    }
    
    func testDetailFactShared() {
        let app = XCUIApplication()
        app.tables.cells.element(boundBy: 1).tap()
        app.navigationBars["Facts.FactsDetailView"].buttons["Share"].tap()
        XCTAssertTrue(app.buttons["Cancel"].exists, "shared controller did not show")
        snapshot("3Shared detail content")
    }
    
}
