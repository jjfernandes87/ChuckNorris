//
//  FactsCollectionInteractor.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsCollectionInteractor: NSObject, FactsCollectionInteractorInputProtocol {

	// MARK: - Viper Module Properties

    weak var output: FactsCollectionInteractorOutputProtocol?

	// MARK: - FactsCollectionInteractorInputProtocol
    func downloadData() {
        let config = RequestService.request(tag: URLEndpoints.facts.rawValue, parameters: ["query": "facts"])
        ApiService.request(config: config, success: { (statusCode, response) in
            
            guard let contract = JSONDecoder.decode(FactsData.self, from: response) else {
                self.output?.facts(GenericsError.unknown)
                return
            }
            
            self.output?.facts(contract.data.result)
            
        }) { (statusCode, error) in
            self.output?.facts(GenericsError.unknown)
        }
    }
    
}
