//
//  RXApiService.swift
//  Facts
//
//  Created by Julio Junior on 15/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftExt

typealias rxSuccess<T> = ((_ success: T) -> Void)
typealias rxFailure = ((_ error: Error) -> Void)

class RXApiService: NSObject {
    
    static let dispose = DisposeBag()
    
    private class func request(config: RequestConfig) -> Observable<String> {
        return Observable<String>.create { (observer) -> Disposable in
            ApiService.request(config: config, success: { (statusCode, response) in
                observer.onNext(response ?? "")
                observer.onCompleted()
            }) { (statusCode, error) in
                observer.onError(GenericsError.unknown)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    class func request<T: Decodable>(config: RequestConfig, type: T.Type, success: @escaping rxSuccess<T>, failure: @escaping rxFailure) {
        _ = RXApiService.request(config: config)
            .retry(.exponentialDelayed(maxCount: 3, initial: 4, multiplier: 1))
            .subscribe(onNext: { (result) in
                guard let contract = JSONDecoder.decode(T.self, from: result) else {
                    failure(GenericsError.parse)
                    return
                }
                success(contract)
            }, onError: { (error) in
                failure(error)
            }
        ).disposed(by: RXApiService.dispose)
    }
}
