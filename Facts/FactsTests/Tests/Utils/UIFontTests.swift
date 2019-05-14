//
//  UIFontTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class UIFontSpec: QuickSpec {
    
    override func spec() {
        describe("UIFont Extension method") {
            it("choice of source from the values: value less than maxValue") {
                let font1 = UIFont.h1
                let font2 = UIFont.h2
                let fontResult = UIFont.chooseFont(value: 10, maxValue: 80, font1: font1, font2: font2)
                expect(fontResult).to(equal(font1))
            }
            
            it("choice of source from the values: value more than maxValue") {
                let font1 = UIFont.h1
                let font2 = UIFont.h2
                let fontResult = UIFont.chooseFont(value: 90, maxValue: 80, font1: font1, font2: font2)
                expect(fontResult).to(equal(font2))
            }
        }
    }
}
