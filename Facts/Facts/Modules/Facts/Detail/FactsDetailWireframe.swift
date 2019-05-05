//
//  FactsDetailWireframe.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class FactsDetailWireframe: NSObject, FactsDetailWireframeProtocol {

	// MARK: - Constants

	private let storyBoardName = "Facts"
	
	// MARK: - Viper Module Properties

	weak var view: FactsDetailView!

	// MARK: - Constructors

	init(content: Facts) {
		super.init()

		let view = self.viewControllerFromStoryboard(FactsDetailView.self)  as! FactsDetailView
		let presenter = FactsDetailPresenter(content: content)

		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		
		self.view = view
	}

    // MARK: - FactsDetailWireframeProtocol

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }
	
}
