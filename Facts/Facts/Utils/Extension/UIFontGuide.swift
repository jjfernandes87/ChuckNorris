//
//  UIFontGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

extension UIFont {
    
    @nonobjc class var h1: UIFont {
        return UIFont.italicSystemFont(ofSize: 24)
    }
    
    @nonobjc class var h2: UIFont {
        return UIFont.italicSystemFont(ofSize: 20)
    }
    
    @nonobjc class var h3: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    @nonobjc class var h4: UIFont {
        return UIFont.boldSystemFont(ofSize: 12)
    }
}
