//
//  MainWireframe.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class MainWireframe: UINavigationController {
    
    // MARK: - Constants
    var window: UIWindow?
    
    // MARK: - Constructors
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
        self.window?.backgroundColor = UIColor.white
        
        self.navigationBar.barStyle = .black
        self.navigationBar.barTintColor = .black
        self.navigationBar.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func launch() {
        guard let view = FactsCollectionWireframe().view else { return }
        self.viewControllers = [view]
        self.window?.rootViewController = self
    }
}
