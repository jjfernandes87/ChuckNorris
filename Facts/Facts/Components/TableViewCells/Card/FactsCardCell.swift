//
//  FactsCardCell.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import SelfTableViewManager

protocol FactsCardCellDelegate: class {
    func sharedFact(_ content: Facts)
}

@objc(FactsCardCell)
class FactsCardCell: CellController {
    
    var model: Facts
    var delegate: FactsCardCellDelegate?

    init(content: Facts, delegate: FactsCardCellDelegate?) {
        self.model = content
        self.delegate = delegate
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! FactsCardCellView
        cell.sharedButton.removeTarget(nil, action: nil, for: .allEvents)
        cell.sharedButton.addTarget(self, action: #selector(sharedContent), for: .touchUpInside)
        cell.sharedButton.isHidden = self.delegate == nil
        cell.factsLabel.text = self.model.value
        cell.factsLabel.font = self.font()
        cell.collection.dataSource = self
        cell.collection.delegate = self
        cell.collection.reloadData()
        return cell
    }
    
    private func font() -> UIFont {
        return self.model.value.count >= 80 ? .h2 : .h1
    }
    
}

// MARK: - UICollectionViewDataSource
extension FactsCardCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.categoryArray().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.tagLabel.text = self.model.categoryArray()[indexPath.item].uppercased()
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FactsCardCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.model.categoryArray()[indexPath.item].uppercased()
        return CGSize(width: text.expectedLabelSize(font: .h3) + 20, height: 32)
    }
}

// MARK: - Actions
@objc extension FactsCardCell {
    func sharedContent() {
        self.delegate?.sharedFact(self.model)
    }
}

class FactsCardCellView: CellView {
    @IBOutlet weak var factsLabel: UILabel!
    @IBOutlet weak var collection: TagCollectionView!
    @IBOutlet weak var sharedButton: UIButton!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.content.layer.shadowRadius = 14
        self.content.layer.shadowOpacity = 0.6
        self.content.layer.shadowColor = UIColor.gray.cgColor
        self.content.layer.cornerRadius = 20
        self.collection.register(UINib(nibName: "TagCell", bundle: nil), forCellWithReuseIdentifier: "TagCell")
        self.collection.invalidateIntrinsicContentSize()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        highlighted ? self.shrinkAnimated() : self.resetAnimated()
    }
    
    //MARK: - Animations
    private func shrinkAnimated() {
        UIView.animate(withDuration: 0.2, animations: { self.content.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) })
    }
    
    private func resetAnimated() {
        UIView.animate(withDuration: 0.2, animations: { self.content.transform = CGAffineTransform.identity })
    }
}
