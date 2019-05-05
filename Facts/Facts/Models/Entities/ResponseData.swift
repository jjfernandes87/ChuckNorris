//
//  ResponseData.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

struct ResponseData: Decodable {
    let responseStatus: ResponseStatus
}

struct ResponseStatus: Codable {
    let statusCode: Int?
    let success: Bool
    let message: String
}
