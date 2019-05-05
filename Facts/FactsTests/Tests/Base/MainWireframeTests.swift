//
//  MainWireframeTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class MainWireframeSpec: QuickSpec {
    
    override func spec() {
        let appdelegate = AppDelegate()
        
        describe("Tests: AppDelegate") {
            it("validate properties") {
                appdelegate.initMainRouter()
                expect(appdelegate.mainRouter?.navigationBar.barTintColor).to(equal(UIColor.black))
                expect(appdelegate.mainRouter?.navigationBar.tintColor).to(equal(UIColor.white))
            }
            
            it("init launch") {
                appdelegate.initMainRouter()
                expect(appdelegate.mainRouter?.viewControllers.count).to(equal(1))
            }
        }
    }
    
}
