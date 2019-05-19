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
        let app = self.loadingAndWaitingApplication()
        let text = "All the religions"
        
        XCTAssertTrue(app.staticTexts[text].exists, "did not show content")
    }
    
    func testDetailFact() {
        let app = self.loadingAndWaitingApplication()
        let text = "All the religions"
        
        app.tables.cells.element(boundBy: 1).tap()
        XCTAssertTrue(app.tables.cells.staticTexts[text].exists, "did not show content")
        snapshot("2Detail")
    }
    
    func testDetailFactShared() {
        let app = self.loadingAndWaitingApplication()
        
        app.tables.cells.element(boundBy: 1).tap()
        app.navigationBars["Facts.FactsDetailView"].buttons["Share"].tap()
        
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"), evaluatedWith: app.buttons["Cancel"], handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
        XCTAssertTrue(app.buttons["Cancel"].exists, "shared controller did not show")
        snapshot("3Shared detail content")
    }
    
}

// MARK: - Private methods
extension FactsUITests {
    func loadingAndWaitingApplication() -> XCUIApplication {
        let app = XCUIApplication()
        let text = "All the religions"
        
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"), evaluatedWith: app.staticTexts[text], handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
        return app
    }
}
