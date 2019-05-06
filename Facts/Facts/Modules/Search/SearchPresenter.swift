//
//  SearchPresenter.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class SearchPresenter: NSObject {

	// MARK: - Viper Module Properties
    weak var view: SearchPresenterOutputProtocol!
    var interactor: SearchInteractorInputProtocol!
    var wireframe: SearchWireframeProtocol!

	// MARK: - Private Methods

}

// MARK: - SearchPresenterInputProtocol
extension SearchPresenter: SearchPresenterInputProtocol {
    func viewDidLoad() {
        var rows = [AnyObject]()
        rows.append(HeaderCell(title: "Sugestões"))
        rows.append(HeaderCell(title: "Ultimas buscas"))
        rows.append(SearchItemCell(title: "Star Wars"))
        rows.append(SearchItemCell(title: "Github"))
        rows.append(SearchItemCell(title: "Dumb"))
        rows.append(SearchItemCell(title: "Trump"))
        self.view.setRows(rows)
    }
    
    func searchBarCancelButtonClicked() {
        self.wireframe.dismissSearchBar()
    }
}

// MARK: - SearchInteractorOutputProtocol
extension SearchPresenter: SearchInteractorOutputProtocol {
    
}
