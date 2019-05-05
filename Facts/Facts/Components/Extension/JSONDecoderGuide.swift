//
//  JSONDecoderGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

extension JSONDecoder {
    
    static func decode<T>(_ type: T.Type, from jsonString: String?) -> T? where T : Decodable {
        let decoder = JSONDecoder()
        guard let data = jsonString, let jsonData = data.data(using: .utf8) else {
            return nil
        }
        
        do {
            let obj = try decoder.decode(type, from: jsonData)
            return obj
        } catch {
            print(error)
            return nil
        }
    }    
}
