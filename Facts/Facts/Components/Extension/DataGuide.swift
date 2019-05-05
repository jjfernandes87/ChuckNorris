//
//  DataGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Foundation

extension Data {
    static func dataFromJson(_ jsonName: String, forClass classType: AnyClass) -> Data? {
        return Data.dataFromJson(jsonName, forBundle: Bundle(for: classType))
    }
    
    static func dataFromJson(_ jsonNmae: String, forBundle bundle: Bundle) -> Data? {
        guard let path = bundle.path(forResource: jsonNmae, ofType: "json") else { return nil }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else { return nil }
        return data
    }
}
