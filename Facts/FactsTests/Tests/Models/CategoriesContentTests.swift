//
//  CategoriesContentTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class CategoriesContentSpec: QuickSpec {
    
    override func spec() {
        var contract: CategoriesContent?
        
        beforeEach {
            if let data = Data.dataFromJson("categories", forClass: CategoriesContentSpec.self) {
                contract = try? JSONDecoder().decode(CategoriesContent.self, from: data)
            }
        }
        
        describe("parse object") {
            it("validate array count") {
                expect(contract?.data.count).toEventually(equal(16))
            }
            
            it("validate fisrt object") {
                let firstObj = contract?.data.first
                expect(firstObj).toEventually(equal("explicit"))
            }
        }
    }
    
}
