//
//  ApiService.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

enum GenericsError: Error {
    case unknown
}

typealias success = ((_ statusCode: Int, _ result: String?) -> Void)
typealias failure = ((_ statusCode: Int, _ error: GenericsError) -> Void)

class ApiService: NSObject {
    
    class func request(config: RequestConfig, success: @escaping success, failure: @escaping failure) {
        Alamofire.request(
            config.url,
            method: config.method,
            parameters: config.parameters,
            encoding: config.parametersEncoding!,
            headers: nil
        ).validate(statusCode: 200..<300)
        .debugLog()
        .responseString(encoding: String.Encoding.utf8) { (response) in
            
            if let data = JSONDecoder.decode(ResponseData.self, from: response.value),
                let statusCode = data.responseStatus.statusCode {
                switch data.responseStatus.success {
                case true: success(statusCode, response.value)
                case false: failure(statusCode, GenericsError.unknown)
                }
                return
            }
            
            switch response.result {
            case .success: success(response.response?.statusCode ?? 200, ApiService.restFormatter(value: response.value))
            case .failure(_): failure(response.response?.statusCode ?? 500, GenericsError.unknown)
            }
            
        }
    }
    
    // MARK: - Private Methods
    private class func restFormatter(value: String?) -> String {
        if let string = value, string.contains("\"data\"") {
            return string
        }
        
        return "{\n\"data\" : \(value ?? "")}\n"
    }
}
