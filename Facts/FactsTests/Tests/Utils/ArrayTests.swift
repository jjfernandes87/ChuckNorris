//
//  ArrayTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class ArraySpec: QuickSpec {
    
    override func spec() {
        describe("Array Extension method") {
            it("test: shuffled method") {
                let array = [1,2,3,4,5,6]
                let newArray = array.shuffled()
                expect(array).toNot(equal(newArray))
            }
            
            it("test: chooseOne method") {
                let array = [1,2,3,4,5,6]
                let oneItem = array.chooseOne
                let resultTrue = array.contains(oneItem)
                expect(resultTrue).to(beTrue())
            }
            
            it("test: choose quantity") {
                let array = [1,2,3,4,5,6]
                let newArray = array.choose(2)
                expect(newArray.count).to(equal(2))
            }
        }
    }
}
