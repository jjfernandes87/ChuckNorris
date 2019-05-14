//
//  ArrayGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 14/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

extension Array {

    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }

    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }

    var chooseOne: Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }

    func choose(_ n: Int) -> Array {
        return Array(shuffled.prefix(n))
    }
}
