//
//  TagCell.swift
//  Facts
//
//  Created by Julio Fernandes on 07/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tagContainer.backgroundColor = .blue
        self.tagLabel.font = .h3
    }
    
    override var isHighlighted: Bool {
        didSet {
            tagContainer.backgroundColor = UIColor.blue.withAlphaComponent(self.isHighlighted ? 0.8 : 1)
        }
    }
}
