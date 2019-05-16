//
//  FactsCollectionInteractor.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsCollectionInteractor: NSObject {

	// MARK: - Viper Module Properties
    weak var output: FactsCollectionInteractorOutputProtocol?
    
}

// MARK: - FactsCollectionInteractorInputProtocol
extension FactsCollectionInteractor: FactsCollectionInteractorInputProtocol {
    
    func downloadData() {
        let config = RequestService.request(tag: URLEndpoints.facts.rawValue, parameters: ["query": "facts"])
        RXApiService.request(config: config, type: FactsData.self, success: { [weak self] (contract) in
            self?.output?.facts(contract.data.result)
        }) { [weak self] (error) in
            self?.output?.facts(error)
        }
    }
    
    func downloadBySearch(_ text: String) {
        let config = RequestService.request(tag: URLEndpoints.facts.rawValue, parameters: ["query": text])
        RXApiService.request(config: config, type: FactsData.self, success: { [weak self] (contract) in
            self?.output?.facts(contract.data.result)
        }) { [weak self] (error) in
            self?.output?.facts(error)
        }
    }
    
    func downloadByCategory(_ category: String) {
        let config = RequestService.request(tag: URLEndpoints.categoriesFacts.rawValue, parameters: ["category": category])
        RXApiService.request(config: config, type: CategotyFact.self, success: { [weak self] (contract) in
            self?.output?.facts([contract.data])
        }) { [weak self] (error) in
            self?.output?.facts(error)
        }
    }
    
}
