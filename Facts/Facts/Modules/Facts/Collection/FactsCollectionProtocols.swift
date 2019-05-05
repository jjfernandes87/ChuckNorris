//
//  FactsCollectionProtocols.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol FactsCollectionWireframeProtocol: class {
    func showDetail(_ content: Facts)
    func showSearch()
}

// MARK: - Interactor

protocol FactsCollectionInteractorInputProtocol {
    func downloadData()
}

// MARK: - Presenter

protocol FactsCollectionPresenterInputProtocol: class {
    func viewDidLoad()
    func viewWillAppear()
    func didSearchButton()
    func didSelectFact(_ content: Facts)
}

protocol FactsCollectionInteractorOutputProtocol: class {
    func facts(_ collection: [Facts])
    func facts(_ error: GenericsError)
}

// MARK: - View

protocol FactsCollectionPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
    func setLoadingView()
}
