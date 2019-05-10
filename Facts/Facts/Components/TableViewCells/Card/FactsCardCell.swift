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
        cell.tagLabel.text = self.model.category?.last?.uppercased() ?? "UNCATEGORIZED"
        return cell
    }
    
    private func font() -> UIFont {
        return self.model.value.count >= 80 ? .h2 : .h1
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
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var sharedButton: UIButton!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.content.layer.shadowRadius = 14
        self.content.layer.shadowOpacity = 0.6
        self.content.layer.shadowColor = UIColor.gray.cgColor
        self.content.layer.cornerRadius = 20
        
        self.tagLabel.backgroundColor = .blue
        self.tagLabel.font = .h2
        self.tagLabel.textColor = .white
        self.tagLabel.textAlignment = .center
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
