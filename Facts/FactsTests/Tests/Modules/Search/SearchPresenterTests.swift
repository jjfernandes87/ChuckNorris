//
//  SearchPresenterTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class SearchPresenterSpec: QuickSpec {
    
    override func spec() {
        var presenter: SearchPresenter!
        let view = MockSearchView()
        let interactor = MockSearchInteractor()
        let wireframe = MockSearchWireframe()
        
        beforeEach {
            presenter = SearchPresenter(delegate: self)
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
        }
        
        describe("validate methods") {
            it("viewDidLoad method") {
                presenter.viewDidLoad()
                expect(interactor.downloadDataBool).toEventually(beTrue())
            }
            
            it("searchBarCancelButtonClicked method") {
                presenter.searchBarCancelButtonClicked()
                expect(wireframe.dismissSearchBarBool).toEventually(beTrue())
            }
            
            it("searchBar method") {
                presenter.searchBar("julio")
                expect(interactor.searchBarBool).toEventually(beTrue())
                expect(interactor.term).toEventually(equal("julio"))
            }
            
            it("output: setRows") {
                presenter.searchData(categories: ["dev"], latestSearch: ["music"])
                expect(view.setRowsBool).toEventually(beTrue())
                expect(view.rows.count).toEventually(equal(4))
            }
        }
    }
    
}

extension SearchPresenterSpec: SearchOutputProtocol {
    
    func searchBar(_ text: String) {
        
    }
    
    func selectedCategory(_ category: String) {
        
    }
    
}

class MockSearchView: SearchPresenterOutputProtocol {
    
    var setRowsBool = false
    var rows = [AnyObject]()
    
    func setRows(_ rows: [AnyObject]) {
        self.rows = rows
        self.setRowsBool = true
    }
    
}

class MockSearchInteractor: SearchInteractorInputProtocol {
    
    var downloadDataBool = false
    var searchBarBool = false
    var term = ""
    
    func downloadData() {
        self.downloadDataBool = true
    }
    
    func searchBar(_ term: String) {
        self.term = term
        self.searchBarBool = true
    }
    
}

class MockSearchWireframe: SearchWireframeProtocol {
    var dismissSearchBarBool = false
    
    func dismissSearchBar() {
        self.dismissSearchBarBool = true
    }
}
