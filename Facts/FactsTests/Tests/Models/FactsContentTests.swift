//
//  FactsContentTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class FactsContentSpec: QuickSpec {
    
    override func spec() {
        var contract: FactsData?
        
        beforeEach {
            if let data = Data.dataFromJson("facts", forClass: FactsContentSpec.self) {
                contract = try? JSONDecoder().decode(FactsData.self, from: data)
            }
        }
        
        describe("parse object") {
            it("validate total") {
                expect(contract?.data.total).to(equal(28))
            }
            
            it("validate fisrt object") {
                let text = "All Chuck Norris facts should be told in a respectful whisper, whilst laying one's palms and forehead on the floor."
                let url = URL(string: "https://api.chucknorris.io/jokes/xs-MfFrTTwSsEM4jVnNDiw")!
                
                expect(contract?.data.result.first?.category?.count).to(equal(1))
                expect(contract?.data.result.first?.value).to(equal(text))
                expect(contract?.data.result.first?.url).to(equal(url))
            }
        }
    }
    
}
