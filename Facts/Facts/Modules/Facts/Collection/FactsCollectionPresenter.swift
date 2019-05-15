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

    // MARK: - Private Methods
    func loadCells(_ collection: [Facts]) {
        var rows = [AnyObject]()
        collection.forEach { (item) in rows.append(FactsCardCell(content: item, delegate: self)) }
        self.view.setRows(rows)
    }
    
    private func setLoading(animate: Bool = true, callback: @escaping () -> Void) {
        self.view.setLoadingView(animate: animate)
        callback()
    }
}

// MARK: - FactsCollectionPresenterInputProtocol
extension FactsCollectionPresenter: FactsCollectionPresenterInputProtocol {
    func viewDidLoad() {
        self.setLoading {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.interactor.downloadData()
            })
        }
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
        print("Acabou com o error: \(error.localizedDescription)")
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
        self.setLoading(animate: false) {
            self.interactor.downloadBySearch(text)
        }
    }
    
    func selectedCategory(_ category: String) {
        self.setLoading(animate: false) {
            self.interactor.downloadByCategory(category)
        }
    }
}
