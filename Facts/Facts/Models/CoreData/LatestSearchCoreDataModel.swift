//
//  LatestSearchCoreDataModel.swift
//  Facts
//
//  Created by Julio Fernandes on 12/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import CoreData

class LatestSearchCoreDataModel: NSObject {
    
    func deleteAll() throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = LatestSearchCD.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        try context.execute(deleteRequest)
        try context.save()
    }

    func save(term: String) throws -> Bool {
        let filtered = try search(term: term)
        if filtered.count == 0 {
            try save(term)
            return true
        }
        return false
    }
    
    func fetch() throws -> [LatestSearchCD] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        
        if let collection = try context.fetch(LatestSearchCD.fetchRequest()) as? [LatestSearchCD] {
            return collection
        }
        
        return []
    }

}

// MARK: - Private methods
extension LatestSearchCoreDataModel {
    private func save(_ data: String) throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let term = LatestSearchCD(context: context)
        term.term = data
        
        try context.save()
    }
    
    private func search(term: String) throws -> [LatestSearchCD] {
        return try self.fetch().filter { (item) -> Bool in
            return item.term == term
        }
    }
}
