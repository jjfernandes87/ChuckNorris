//
//  Facts.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Foundation

struct FactsData: Codable {
    let data: FactsContent
}

struct FactsContent: Codable {
    let total: Int
    let result: [Facts]
}

struct Facts: Codable {
    let category: [String]?
    let url: URL
    let value: String
    
    func categoryArray() -> [String] {
        guard let category = category else { return ["uncategorized"] }
        return category
    }
}
