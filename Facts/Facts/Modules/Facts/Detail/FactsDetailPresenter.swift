//
//  FactsDetailPresenter.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsDetailPresenter: NSObject, FactsDetailPresenterInputProtocol {

	// MARK: - Viper Module Properties
    weak var view: FactsDetailPresenterOutputProtocol!
    var wireframe: FactsDetailWireframeProtocol!
    var model: Facts
    
    init(content: Facts) {
        self.model = content
        super.init()
    }
    
    // MARK: - FactsDetailPresenterInputProtocol

    // MARK: - FactsDetailPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
