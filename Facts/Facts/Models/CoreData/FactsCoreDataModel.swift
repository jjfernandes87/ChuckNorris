//
//  FactsCoreDataModel.swift
//  Facts
//
//  Created by Julio Fernandes on 19/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import CoreData

class FactsCoreDataModel: NSObject {
    
    func syncData(_ facts: [Facts], term: String) -> (Bool, [FactCD]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return (false, []) }
        let context = appDelegate.persistentContainer.viewContext
        
        var successfull = false
        
        context.performAndWait {
            facts.forEach { (factItem) in
                do {
                    if try search(id: factItem.id, term: term).count == 0 {
                        try self.saveBySearch(factItem, term: term)
                    } else {
                        print("id: \(factItem.id) já existe")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            successfull = true
        }
        
        return (successfull, try! self.fetchByTerm(term))
    }
    
    func fetchByTerm(_ term: String) throws -> [FactCD] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<FactCD> = FactCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "term == %@", term)
        
        do {
           let collection = try context.fetch(fetchRequest)
           return collection
        } catch {
            return []
        }
    }
    
}

// MARK: - Private methods
extension FactsCoreDataModel {
    private func saveBySearch(_ fact: Facts, term: String) throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let factCD = FactCD(context: context)
        factCD.id = fact.id
        factCD.value = fact.value
        factCD.url = fact.url.absoluteString
        factCD.category = fact.category ?? ["uncategorized"]
        factCD.term = term
        
        try context.save()
    }
    
    private func search(id: String, term: String) throws -> [FactCD] {
        return try self.fetchByTerm(term).filter { (item) -> Bool in
            return item.id == id
        }
    }
}
