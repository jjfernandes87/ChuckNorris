//
//  FactsDetailProtocols.swift
//  Facts
//
//  Created Julio Fernandes on 05/05/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol FactsDetailWireframeProtocol: class {

}

// MARK: - Presenter

protocol FactsDetailPresenterInputProtocol: class {
    func viewDidLoad()
    func didShareAction()
}

// MARK: - View

protocol FactsDetailPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
}
