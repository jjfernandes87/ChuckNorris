//
//  RequestGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 12/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Alamofire

extension Request {
    public func debugLog() -> Self {
        debugPrint(self)
        return self
    }
}
