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
    internal lazy var localManager = LatestSearchCoreDataModel()
    
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
            try self.localManager.save(term: term)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Private Methods
extension SearchInteractor {
    private func downloadCategories(dispatch: DispatchGroup) {
        let config = RequestService.request(tag: URLEndpoints.categories.rawValue)
        
        dispatch.enter()
        ApiService.request(config: config, success: { [weak self] (statusCode, response) in
            
            guard let contract = JSONDecoder.decode(CategoriesContent.self, from: response) else {
                self?.categories = []
                dispatch.leave()
                return
            }
            
            self?.categories = contract.data
            dispatch.leave()
            
        }) { [weak self] (statusCode, error) in
            self?.categories = []
            dispatch.leave()
        }
    }
    
    private func downloadTerms(dispatch: DispatchGroup) {
        dispatch.enter()
        do {
            let collection = try self.localManager.fetch()
            self.latestSearch = collection.compactMap({ $0.term })
            dispatch.leave()
        } catch {
            self.latestSearch = []
            dispatch.leave()
        }
    }
}
