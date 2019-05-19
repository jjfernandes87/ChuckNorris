//
//  AppSequenceTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 19/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
import LaunchApplication
@testable import Facts

class AppSequenceSpec: QuickSpec {
    
    override func spec() {
        var appSequence: MockSequence?
        
        beforeEach {
            appSequence = MockSequence()
            appSequence?.launchWithDelegate(delegate: appSequence!)
        }
        
        describe("if method was called") {
            it("test: method1") {
                expect(appSequence?.method1Bool).toEventually(beTrue())
            }
            
            it("test: if sequence was finished") {
                expect(appSequence?.didFinishLaunchSequenceBool).toEventually(beTrue())
            }
        }
    }
}

class MockSequence: AppSequence, LaunchApplicationProtocol {
    
    override func launchAndRelaunchSequence() {
        launchSequence.append("LaunchStage_method1")
    }
    
    var method1Bool = false
    
    @objc func method1() {
        method1Bool = true
        nextLaunchStage()
    }
    
    var didFinishLaunchSequenceBool = false
    func didFinishLaunchSequence(application: LaunchApplication) {
        self.didFinishLaunchSequenceBool = true
    }
}
