//
//  FactsCollectionInteractor.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

typealias factsCallback = ((_ facts: [Facts]?, _ error: GenericsError?) -> Void)

class FactsCollectionInteractor: NSObject {

	// MARK: - Viper Module Properties
    weak var output: FactsCollectionInteractorOutputProtocol?
    internal lazy var factManager = FactsCoreDataModel()
    
}

// MARK: - FactsCollectionInteractorInputProtocol
extension FactsCollectionInteractor: FactsCollectionInteractorInputProtocol {
    
    func downloadData() {
        let term = "facts"
        self.fetchByTerm(parameters: ["query": term], term: term)
    }

    func downloadBySearch(_ text: String) {
        self.fetchByTerm(parameters: ["query": text], term: text)
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

// MARK: - External API download
extension FactsCollectionInteractor {
    
    /// Faz o download pelo termo buscado na API externa
    ///
    /// - Parameters:
    ///   - parameters: parametro de busca
    ///   - completion: callback com retorno da API
    private func downloadData(parameters: [String: Any], completion: @escaping factsCallback) {
        let config = RequestService.request(tag: URLEndpoints.facts.rawValue, parameters: parameters)
        RXApiService.request(config: config, type: FactsData.self, success: { (contract) in
            completion(contract.data.result, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
    
    /// Faz a busca de dados na API e consolida no coredata
    ///
    /// - Parameters:
    ///   - parameters: query string
    ///   - term: termo buscado
    private func fetchByTerm(parameters: [String: Any], term: String) {
        self.downloadData(parameters: ["query": term]) { [weak self] (collection, genericError) in
            
            //Erro ao buscar dados da API e verifica no banco se existe dados
            if let error = genericError {
                
                do {
                    let collection = try self?.factManager.fetchByTerm(term)
                    self?.syncResult((true, collection ?? []))
                } catch _ {
                    self?.output?.facts(error)
                }
                
                return
            }
            
            //Sync com o coredata
            if let facts = collection {
                self?.syncResult(self?.factManager.syncData(facts, term: term))
                return
            }
            
            //Erro desconhecido já que não temos nem coleção de dados e erro na API
            self?.output?.facts(GenericsError.unknown)
        }
    }
    
    /// Retorna os dados recuperados no coredata para a aplicação
    ///
    /// - Parameter result: sync result
    private func syncResult(_ result: SyncResult?) {
        guard let data = result else {
            self.output?.facts(GenericsError.unknown)
            return
        }
        
        if !data.successfull {
            self.output?.facts(GenericsError.unknown)
            return
        }
        
        self.output?.facts(self.factManager.convert(data.collection))
    }
}
