//
//  SearchWireframe.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class SearchWireframe: NSObject, SearchWireframeProtocol {

	// MARK: - Constants

	private let storyBoardName = "Search"
	
	// MARK: - Viper Module Properties

	weak var view: SearchView!

	// MARK: - Constructors

	init(delegate: SearchOutputProtocol) {
		super.init()

		let view = self.viewControllerFromStoryboard(SearchView.self)  as! SearchView
		let interactor = SearchInteractor()
		let presenter = SearchPresenter(delegate: delegate)

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - SearchWireframeProtocol
    func dismissSearchBar() {
        self.view.navigationController?.popViewController(animated: true)
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }
	
}
