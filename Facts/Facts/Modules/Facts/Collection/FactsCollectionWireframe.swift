//
//  FactsCollectionWireframe.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsCollectionWireframe: NSObject, FactsCollectionWireframeProtocol {

	// MARK: - Constants

	private let storyBoardName = "Facts"
	
	// MARK: - Viper Module Properties

	weak var view: FactsCollectionView!

	// MARK: - Constructors

	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard(FactsCollectionView.self, title: "CHUCK NORRIS FACTS")  as! FactsCollectionView
		let interactor = FactsCollectionInteractor()
		let presenter = FactsCollectionPresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - FactsCollectionWireframeProtocol
    func showDetail(_ content: Facts) {
        guard let view = FactsDetailWireframe(content: content).view else { return }
        self.view.navigationController?.pushViewController(view, animated: true)
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }
	
}
