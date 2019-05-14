//
//  CategoriesCoreDataModel.swift
//  Facts
//
//  Created by Julio Fernandes on 12/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import CoreData

class CategoriesCoreDataModel: NSObject {
    
    func save(_ data: [String]) throws -> Bool {
        try self.deleteAll()
        
        var result = true
        let date = Date()
        data.forEach { (tag) in
            do {
                try self.save(tag, date: date)
            } catch {
                print(error.localizedDescription)
                result = false
            }
        }
        
        return result
    }
    
    func fetch() throws -> [Category] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        
        if let collection = try context.fetch(Category.fetchRequest()) as? [Category] {
            return collection
        }
        
        return []
    }
}

// MARK: - Private methods
extension CategoriesCoreDataModel {
    private func save(_ data: String, date: Date) throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let category = Category(context: context)
        category.tag = data
        category.updatedAt = date
            
        try context.save()
    }
    
    private func deleteAll() throws {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Category.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        try context.execute(deleteRequest)
        try context.save()
    }
}
