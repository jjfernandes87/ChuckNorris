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
    weak var delegate: SearchOutputProtocol?
    var interactor: SearchInteractorInputProtocol!
    var wireframe: SearchWireframeProtocol!
    
    init(delegate: SearchOutputProtocol) {
        self.delegate = delegate
        super.init()
    }

}

// MARK: - SearchPresenterInputProtocol
extension SearchPresenter: SearchPresenterInputProtocol {
    func viewDidLoad() {
        self.interactor.downloadData()
    }
    
    func searchBarCancelButtonClicked() {
        self.wireframe.dismissSearchBar()
    }
    
    func searchBar(_ text: String) {
        self.delegate?.searchBar(text)
        self.interactor.searchBar(text)
        self.searchBarCancelButtonClicked()
    }
}

// MARK: - SearchInteractorOutputProtocol
extension SearchPresenter: SearchInteractorOutputProtocol {
    func searchData(categories: [String], latestSearch: [String]) {
        var rows = [AnyObject]()
        
        if categories.count > 0 {
            rows.append(HeaderCell(title: "Sugestões"))
            rows.append(TagCloudCell(tags: categories, delegate: self))
        }
        
        if latestSearch.count > 0 {
            rows.append(HeaderCell(title: "Ultimas buscas"))
            latestSearch.forEach { (term) in
                rows.append(SearchItemCell(title: term))
            }
        }
        
        self.view.setRows(rows)
    }
}

// MARK: - TagDelegate
extension SearchPresenter: TagDelegate {
    func selectedTag(_ tag: String) {
        self.delegate?.selectedCategory(tag)
        self.searchBarCancelButtonClicked()
    }
}
