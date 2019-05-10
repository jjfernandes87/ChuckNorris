//
//  FactsCollectionPresenter.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsCollectionPresenter: NSObject {

	// MARK: - Viper Module Properties
    weak var view: FactsCollectionPresenterOutputProtocol!
    var interactor: FactsCollectionInteractorInputProtocol!
    var wireframe: FactsCollectionWireframeProtocol!
    var firstLoad = true

    // MARK: - Private Methods
    func loadCells(_ collection: [Facts]) {
        var rows = [AnyObject]()
        collection.forEach { (item) in rows.append(FactsCardCell(content: item, delegate: self)) }
        self.view.setRows(rows)
    }
}

// MARK: - FactsCollectionPresenterInputProtocol
extension FactsCollectionPresenter: FactsCollectionPresenterInputProtocol {
    func viewDidLoad() {
        self.view.setLoadingView()
    }
    
    func viewWillAppear() {
        if firstLoad == false { return }
        self.firstLoad = false
        self.interactor.downloadData()
    }
    
    func didSelectFact(_ content: Facts) {
        self.wireframe.showDetail(content)
    }
    
    func didSearchButton() {
        self.wireframe.showSearch(delegate: self)
    }
}

// MARK: - FactsCollectionInteractorOutputProtocol
extension FactsCollectionPresenter: FactsCollectionInteractorOutputProtocol {
    func facts(_ collection: [Facts]) {
        self.loadCells(collection)
    }
    
    func facts(_ error: GenericsError) {
        print(error.localizedDescription)
    }
}

// MARK: - FactsCardCellDelegate
extension FactsCollectionPresenter: FactsCardCellDelegate {
    func sharedFact(_ content: Facts) {
        SharedContent.sharedContent(urlShare: content.url, title: "Chuck Norris Fact", message: content.value)
    }
}

// MARK: - SearchOutputProtocol
extension FactsCollectionPresenter: SearchOutputProtocol {
    func searchBar(_ text: String) {
        self.view.setLoadingView()
        self.interactor.downloadBySearch(text)
    }
    
    func selectedCategory(_ category: String) {
        self.view.setLoadingView()
        self.interactor.downloadByCategory(category)
    }
}
