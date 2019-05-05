//
//  FactsCollectionView.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import SelfTableViewManager

class FactsCollectionView: UIViewController {
    
    // MARK: - Module @IBoutlets
    @IBOutlet weak var tableView: SelfTableViewManager!
    
	// MARK: - Viper Module Properties
	var presenter: FactsCollectionPresenterInputProtocol!

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScreen()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
	// MARK: - Private Methods
    private func setupScreen() {
        self.tableView.managerProtocol = self
    }
}

// MARK: - FactsCollectionPresenterOutputProtocol
extension FactsCollectionView: FactsCollectionPresenterOutputProtocol {
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
    }
}

// MARK: - TableViewManagerDelegate
extension FactsCollectionView: TableViewManagerDelegate {
    func tableViewManager(table: SelfTableViewManager, didSelectRow row: CellController, atSection section: SectionController?) {
        switch row {
        case (is FactsCardCell): self.presenter.didSelectFact((row as! FactsCardCell).model)
        default: break
        }
    }
}

