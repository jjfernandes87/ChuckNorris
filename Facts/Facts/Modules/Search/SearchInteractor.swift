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

	// MARK: - SearchInteractorInputProtocol
    func downloadData() {
        let config = RequestService.request(tag: URLEndpoints.categories.rawValue)
        ApiService.request(config: config, success: { (statusCode, response) in
            guard let contract = JSONDecoder.decode(CategoriesContent.self, from: response) else {
                self.output?.categories(GenericsError.unknown)
                return
            }
            self.output?.categories(contract.data)
        }) { (statusCode, error) in
            self.output?.categories(GenericsError.unknown)
        }
    }

    // MARK: - Private Methods

}
