//
//  RequestServiceTests.swift
//  FactsTests
//
//  Created by Julio Fernandes on 19/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Facts

class RequestServiceSpec: QuickSpec {

    override func spec() {
        describe("test: RequestService class") {
            it("test: Make a request config api") {
                let config = RequestService.request(tag: "facts")
                expect(config.url.absoluteString).to(equal(self.makeURL("${bundle}/facts.json")))
                expect(config.method).to(equal(.get))
            }
            
            it("test: Make a request config api with method") {
                let config = RequestService.request(tag: "facts", method: .post)
                expect(config.method).to(equal(.post))
            }
            
            it("test: Make a request config api with replacement") {
                let config = RequestService.request(tag: "test", replacements: ["id": "1"])
                expect(config.url.absoluteString).to(equal(self.makeURL("${bundle}/test/1")))
            }
        }
    }
    
    private func makeURL(_ urlString: String) -> String {
        return urlString.replacingOccurrences(of: "${bundle}", with: Bundle.main.bundleURL.absoluteString)
    }

}
