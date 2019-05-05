//
//  FactsDetailPresenterTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class FactsDetailPresenterSpec: QuickSpec {
    
    override func spec() {
        var presenter: FactsDetailPresenter!
        let view = MockDetailView()
        
        beforeEach {
            let url = URL(string: "https://api.chucknorris.io/jokes/xs-MfFrTTwSsEM4jVnNDiw")!
            let text = "All Chuck Norris facts should be told in a respectful whisper, whilst laying one's palms and forehead on the floor."
            
            presenter = FactsDetailPresenter(content: Facts(category: nil, url: url, value: text))
            presenter.view = view
        }
        
        describe("validate methods") {
            it("setRows was called") {
                presenter.viewDidLoad()
                expect(view.setRowsBool).toEventually(equal(true))
            }
        }
    }
    
}

class MockDetailView: FactsDetailPresenterOutputProtocol {
    var setRowsBool = false
    func setRows(_ rows: [AnyObject]) {
        self.setRowsBool = true
    }
}
