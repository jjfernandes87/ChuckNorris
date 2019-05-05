//
//  FactsDetailPresenter.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class FactsDetailPresenter: NSObject {

	// MARK: - Viper Module Properties
    weak var view: FactsDetailPresenterOutputProtocol!
    var wireframe: FactsDetailWireframeProtocol!
    var content: Facts
    
    init(content: Facts) {
        self.content = content
        super.init()
    }
    
    // MARK: - Private Methods

}

// MARK: - FactsDetailPresenterInputProtocol
extension FactsDetailPresenter: FactsDetailPresenterInputProtocol {
    func viewDidLoad() {
        var rows = [AnyObject]()
        rows.append(FactsCardCell(content: content, delegate: nil))
        self.view.setRows(rows)
    }
    
    func didShareAction() {
        SharedContent.sharedContent(urlShare: content.url, title: "Chuck Norris Fact", message: content.value)
    }
}
