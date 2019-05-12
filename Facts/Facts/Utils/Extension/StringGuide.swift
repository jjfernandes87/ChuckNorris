//
//  StringGuide.swift
//  Facts
//
//  Created by Julio Fernandes on 07/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

extension String {
    func expectedLabelSize(font: UIFont) -> CGFloat {
        let text = UILabel(frame: .zero)
        text.font = font
        text.text = self
        text.sizeToFit()
        return text.intrinsicContentSize.width
    }
}
