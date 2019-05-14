//
//  HeaderCell.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import SelfTableViewManager

@objc(HeaderCell)
class HeaderCell: CellController {
    
    var title: String
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! HeaderCellView
        cell.titleLabel.text = self.title
        return cell
    }
}

class HeaderCellView: CellView {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = .h4
        self.titleLabel.textColor = .lightGray
    }
}
