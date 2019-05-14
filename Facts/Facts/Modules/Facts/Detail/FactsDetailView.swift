//
//  FactsDetailView.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsDetailView: BaseView {

	// MARK: - Viper Module Properties

	var presenter: FactsDetailPresenterInputProtocol!

	// MARK: - Override methods

	override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    @IBAction func shareAction() {
        self.presenter.didShareAction()
    }

}

// MARK: - FactsDetailPresenterOutputProtocol
extension FactsDetailView: FactsDetailPresenterOutputProtocol {
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
        self.tableView.isUserInteractionEnabled = false
    }
}
