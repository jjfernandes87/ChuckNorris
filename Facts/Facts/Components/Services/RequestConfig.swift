//
//  RequestConfig.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

struct RequestConfig {
    var tag: String
    var url: URL
    var method: HTTPMethod = .get
    var parameters: Parameters? = nil
    var parametersEncoding: ParameterEncoding? = JSONEncoding.default
}
