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
            self?.output?.facts(error as! GenericsError)
        }
    }
    
    func downloadBySearch(_ text: String) {
        let config = RequestService.request(tag: URLEndpoints.facts.rawValue, parameters: ["query": text])
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
    
    func downloadByCategory(_ category: String) {
        let config = RequestService.request(tag: URLEndpoints.categoriesFacts.rawValue, parameters: ["category": category])
        ApiService.request(config: config, success: { (statusCode, response) in
            guard let contract = JSONDecoder.decode(CategotyFact.self, from: response) else {
                self.output?.facts(GenericsError.unknown)
                return
            }
            self.output?.facts([contract.data])
        }) { (statusCode, error) in
            self.output?.facts(GenericsError.unknown)
        }
    }
}
