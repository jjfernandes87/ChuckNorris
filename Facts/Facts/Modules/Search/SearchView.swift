//
//  SearchView.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

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
        self.search.setShowsCancelButton(true, animated: true)
    }

    // MARK: - Private Methods
    private func addSearchBar() {
        self.search = UISearchBar(frame: self.navigationController!.navigationBar.frame)
        self.search.delegate = self
        self.navigationItem.titleView = search
        self.navigationItem.hidesBackButton = true
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
}
