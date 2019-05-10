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
}

// MARK: - Presenter

protocol SearchPresenterInputProtocol: class {
    func viewDidLoad()
    func searchBarCancelButtonClicked()
    func searchBar(_ text: String)
}

protocol SearchInteractorOutputProtocol: class {
    func categories(_ categories: [String])
    func categories(_ error: GenericsError)
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
