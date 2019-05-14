//
//  SearchInteractor.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class SearchInteractor: NSObject, SearchInteractorInputProtocol {

	// MARK: - Viper Module Properties
    weak var output: SearchInteractorOutputProtocol?
    
    internal var categories: [String]?
    internal var latestSearch: [String]?
    internal lazy var termsManager = LatestSearchCoreDataModel()
    internal lazy var categoriesManager = CategoriesCoreDataModel()
    
	// MARK: - SearchInteractorInputProtocol
    func downloadData() {
        let dispatch = DispatchGroup()
        downloadCategories(dispatch: dispatch)
        downloadTerms(dispatch: dispatch)
        
        dispatch.notify(queue: .main) {
            if let categoriesData = self.categories, let latestSearchData = self.latestSearch {
                self.output?.searchData(categories: categoriesData, latestSearch: latestSearchData.reversed())
            }
        }
    }
    
    func searchBar(_ term: String) {
        do {
            _ = try self.termsManager.save(term: term)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Private Methods
extension SearchInteractor {
    private func downloadCategories(dispatch: DispatchGroup) {
        dispatch.enter()
        do {
            let collection = try self.categoriesManager.fetch()
            self.categories = collection.compactMap({ $0.tag }).choose(8)
            dispatch.leave()
        } catch {
            self.categories = []
            dispatch.leave()
        }
    }
    
    private func downloadTerms(dispatch: DispatchGroup) {
        dispatch.enter()
        do {
            let collection = try self.termsManager.fetch()
            self.latestSearch = collection.compactMap({ $0.term })
            dispatch.leave()
        } catch {
            self.latestSearch = []
            dispatch.leave()
        }
    }
}
