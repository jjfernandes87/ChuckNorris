//
//  SearchView.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import SelfTableViewManager

class SearchView: BaseView {
    
	// MARK: - Viper Module Properties
	var presenter: SearchPresenterInputProtocol!
    var search: UISearchBar!

	// MARK: - Override methods

	override func viewDidLoad() {
        super.viewDidLoad()
        self.addSearchBar()
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.searchBecomeResponder()
    }

    // MARK: - Private Methods
    private func addSearchBar() {
        self.search = UISearchBar(frame: self.navigationController!.navigationBar.frame)
        self.search.delegate = self
        self.navigationItem.titleView = search
        self.navigationItem.hidesBackButton = true
    }
    
    private func searchBecomeResponder() {
        self.search.setShowsCancelButton(true, animated: true)
        self.search.becomeFirstResponder()
    }
}

// MARK: - SearchPresenterOutputProtocol
extension SearchView: SearchPresenterOutputProtocol {
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
    }
}

// MARK: - UISearchBarDelegate
extension SearchView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.searchBarCancelButtonClicked()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.presenter.searchBarSearch(text)
    }
}

// MARK: - TableViewManagerDelegate
extension SearchView: TableViewManagerDelegate {
    func tableViewManager(table: SelfTableViewManager, didSelectRow row: CellController, atSection section: SectionController?) {
        switch row {
        case (is SearchItemCell): self.presenter.searchBarSearch((row as! SearchItemCell).title)
        default: break
        }
    }
}
