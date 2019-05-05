//
//  AppDelegateTests.swift
//  AppDelegateTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class AppDelegateSpec: QuickSpec {
    
    override func spec() {
        let appdelegate = AppDelegate()
        
        describe("Tests: AppDelegate") {
            it("init Window") {
                expect(appdelegate.window).toEventually(beNil())
                appdelegate.initWindow()
                expect(appdelegate.window).toEventuallyNot(beNil())
            }
            
            it("init Router") {
                expect(appdelegate.mainRouter).toEventually(beNil())
                appdelegate.initMainRouter()
                expect(appdelegate.mainRouter).toEventuallyNot(beNil())
            }
        }
    }
    
}
