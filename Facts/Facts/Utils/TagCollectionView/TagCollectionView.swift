//
//  TagCollectionView.swift
//  Facts
//
//  Created by Julio Fernandes on 07/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class TagCollectionView: UICollectionView {

    override func layoutSubviews() {
        super.layoutSubviews()
        if __CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) == false {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
