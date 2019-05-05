//
//  RequestService.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire
import ConfigurationProvider

class RequestService: NSObject {
    
    class func request(tag: String, method: HTTPMethod = .get, parameters: [String : Any]? = nil) -> RequestConfig {
        return RequestService.request(tag: tag, method: method, parameters: parameters, replacements: [:])
    }
    
    class func request(tag: String, method: HTTPMethod = .get, parameters: [String : Any]? = nil, replacements: [String : Any]) -> RequestConfig {
        let url = URLConfigurationProvider.urlBy(tag: tag, replacements: replacements as NSDictionary, hasDomain: false)
        let encoding = RequestService.encoding(method)
        return RequestConfig(tag: tag, url: url!, method: method, parameters: parameters, parametersEncoding: encoding)
    }
    
    class func encoding(_ method: HTTPMethod) -> ParameterEncoding {
        return method == .get ? URLEncoding.queryString : JSONEncoding.default
    }
}
