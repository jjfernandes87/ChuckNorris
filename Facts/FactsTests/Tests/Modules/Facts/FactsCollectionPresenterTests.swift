//
//  FactsCollectionPresenterTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class FactsCollectionPresenterSpec: QuickSpec {
    
    override func spec() {
        var presenter: FactsCollectionPresenter!
        let view = MockCollectionView()
        let interactor = MockInteractor()
        let wireframe = MockWireframe()
        
        beforeEach {
            presenter = FactsCollectionPresenter()
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
        }
        
        describe("validate methods") {
            it("setLoadingView was called") {
                presenter.viewDidLoad()
                expect(view.setLoadingViewBool).toEventually(equal(true))
            }
            
            it("downloadData was called") {
                presenter.viewWillAppear()
                expect(interactor.downloadDataBool).toEventually(equal(true))
            }
            
            it("actions was called") {
                presenter.didSearchButton()
                expect(wireframe.showSearchBool).toEventually(equal(true))
            }
        }
    }
    
}

class MockCollectionView: FactsCollectionPresenterOutputProtocol {
    var setLoadingViewBool = false
    var setRowsBool = false
    
    func setRows(_ rows: [AnyObject]) {
        self.setRowsBool = true
    }
    
    func setLoadingView() {
        self.setLoadingViewBool = true
    }
    
}

class MockInteractor: FactsCollectionInteractorInputProtocol {
    var downloadDataBool = false
    
    func downloadData() {
        self.downloadDataBool = true
    }
}

class MockWireframe: FactsCollectionWireframeProtocol {
    var showSearchBool = false
    
    func showDetail(_ content: Facts) {
        
    }
    
    func showSearch() {
        self.showSearchBool = true
    }
}
