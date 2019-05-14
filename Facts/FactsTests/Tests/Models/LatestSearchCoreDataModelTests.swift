//
//  LatestSearchCoreDataModelTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class LatestSearchCoreDataModelSpec: QuickSpec {
    
    override func spec() {
        var coredata: LatestSearchCoreDataModel?
        
        beforeEach {
            coredata = LatestSearchCoreDataModel()
        }
        
        describe("coredata methods") {
            it("test: save method - new value") {
                try! coredata?.deleteAll()
                let result = try! coredata?.save(term: "dev")
                expect(result).toEventually(beTrue())
            }
            
            it("test: save method - same value") {
                try! coredata?.deleteAll()
                let _ = try! coredata?.save(term: "dev")
                let result = try! coredata?.save(term: "dev")
                expect(result).toEventually(beFalse())
            }
            
            it("test: fetch method") {
                try! coredata?.deleteAll()
                let _ = try! coredata?.save(term: "dev")
                let collection = try! coredata?.fetch()
                expect(collection?.count).toEventually(equal(1))
            }
        }
    }
    
}
