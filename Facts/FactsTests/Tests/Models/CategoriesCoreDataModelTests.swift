//
//  CategoriesCoreDataModelTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class CategoriesCoreDataModelSpec: QuickSpec {
    
    override func spec() {
        var coredata: CategoriesCoreDataModel?
        let names = ["Julio", "Priscila", "Pedro"]
        
        beforeEach {
            coredata = CategoriesCoreDataModel()
        }
        
        describe("coredata methods") {
            it("test: save method") {
                let result = try! coredata?.save(names)
                expect(result).toEventually(beTrue())
            }
            
            it("test: fetch method") {
                let _ = try! coredata?.save(names)
                let collection = try! coredata?.fetch()
                expect(collection?.count).toEventually(equal(names.count))
            }
        }
    }
    
}
