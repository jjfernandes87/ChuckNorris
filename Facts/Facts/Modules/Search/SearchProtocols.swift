//
//  SearchProtocols.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol SearchWireframeProtocol: class {
    func dismissSearchBar()
}

// MARK: - Interactor

protocol SearchInteractorInputProtocol {
    func downloadData()
    func searchBar(_ term: String)
}

// MARK: - Presenter

protocol SearchPresenterInputProtocol: class {
    func viewDidLoad()
    func searchBarCancelButtonClicked()
    func searchBar(_ text: String)
}

protocol SearchInteractorOutputProtocol: class {
    func searchData(categories: [String], latestSearch: [String])
}

// MARK: - View

protocol SearchPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
}

// MARK: - Delegate

protocol SearchOutputProtocol: class {
    func searchBar(_ text: String)
    func selectedCategory(_ category: String)
}
