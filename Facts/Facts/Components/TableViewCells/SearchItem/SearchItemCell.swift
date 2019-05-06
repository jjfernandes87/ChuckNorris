//
//  SearchItemCell.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import SelfTableViewManager

@objc(SearchItemCell)
class SearchItemCell: HeaderCell {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView: tableView, cellForRowAtIndexPath: indexPath) as! SearchItemCellView
        cell.titleLabel.text = self.title
        return cell
    }
}

class SearchItemCellView: HeaderCellView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = .h2
        self.titleLabel.textColor = .black
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        self.contentView.backgroundColor = highlighted ? .groupTableViewBackground : .white
    }
}
