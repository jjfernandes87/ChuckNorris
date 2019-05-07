//
//  TagCloudCell.swift
//  Facts
//
//  Created by Julio Fernandes on 07/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import SelfTableViewManager

protocol TagDelegate: class {
    func selectedTag(_ tag: String)
}

@objc(TagCloudCell)
class TagCloudCell: CellController {
    
    var tags: [String]
    weak var delegate: TagDelegate?
    
    init(tags: [String], delegate: TagDelegate? = nil) {
        self.tags = tags
        self.delegate = delegate
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! TagCloudCellView
        cell.collection.reloadData()
        cell.collection.layoutIfNeeded()
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension TagCloudCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.tagLabel.text = self.tags[indexPath.item].uppercased()
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TagCloudCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.tags[indexPath.item].uppercased()
        return CGSize(width: text.expectedLabelSize(font: .h3) + 20, height: 32)
    }
}

// MARK: - UICollectionViewDelegate
extension TagCloudCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedTag(self.tags[indexPath.item])
    }
}

class TagCloudCellView: CellView {
    @IBOutlet weak var collection: TagCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collection.register(UINib(nibName: "TagCell", bundle: nil), forCellWithReuseIdentifier: "TagCell")
        collection.invalidateIntrinsicContentSize()
        
    }
}
