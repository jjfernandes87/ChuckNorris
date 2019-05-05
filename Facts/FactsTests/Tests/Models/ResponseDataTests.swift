//
//  ResponseDataTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class ResponseDataSpec: QuickSpec {
    
    override func spec() {
        var contract: ResponseData?
        
        beforeEach {
            if let data = Data.dataFromJson("facts", forClass: ResponseDataSpec.self) {
                contract = try? JSONDecoder().decode(ResponseData.self, from: data)
            }
        }
        
        describe("parse object") {
            it("validate object") {
                expect(contract?.responseStatus.statusCode).to(equal(200))
                expect(contract?.responseStatus.message).to(equal("Sucesso"))
            }
        }
    }
    
}
