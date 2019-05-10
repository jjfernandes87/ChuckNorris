//
//  FactsCollectionView.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import SelfTableViewManager

class FactsCollectionView: BaseView {
    
    // MARK: - Module @IBoutlets
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
	// MARK: - Viper Module Properties
	var presenter: FactsCollectionPresenterInputProtocol!

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScreen()
        self.presenter.viewDidLoad()
    }

    override func showPresenting() {
        super.showPresenting()
        
        if self.topLayout.constant == 0 { return }
        
        self.topLayout.constant = 0
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 88,
                       initialSpringVelocity: 3,
                       options: .curveEaseIn,
                       animations: {
                        self.view.layoutIfNeeded()
        })
    }
    
	// MARK: - Private Methods
    private func setupScreen() {
        self.tableView.managerProtocol = self
        self.topLayout.constant = UIScreen.main.bounds.height
        self.view.backgroundColor = .groupTableViewBackground
    }
    
    @IBAction func searchAction() {
        self.presenter.didSearchButton()
    }
}

// MARK: - FactsCollectionPresenterOutputProtocol
extension FactsCollectionView: FactsCollectionPresenterOutputProtocol {
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
        self.setViewStatus((rows.count > 0) ? BaseStatus.presenting : BaseStatus.noContent, animated: false)
    }
    
    func setLoadingView(animate: Bool) {
        self.setViewStatus(.loading, animated: animate)
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

