//
//  AppSequence.swift
//  Facts
//
//  Created by Julio Fernandes on 12/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import LaunchApplication

class AppSequence: LaunchApplication {
    @objc func launchAndRelaunchSequence() {
        launchSequence.append("LaunchStage_preloadedXib")
        launchSequence.append("LaunchStage_downloadCategories")
    }
}

// MARK: - Launch methods
@objc extension AppSequence {
    func preloadedXib() {
        preloadedLoadingXib = UINib(nibName: "LoadingView", bundle: Bundle.main)
        preloadedNoContentXib = UINib(nibName: "NoContent", bundle: Bundle.main)
        preloadedMasterErrorXib = UINib(nibName: "MasterError", bundle: Bundle.main)
        nextLaunchStage()
    }
    
    func downloadCategories() {
        let categoriesManager = CategoriesCoreDataModel()
        let config = RequestService.request(tag: URLEndpoints.categories.rawValue)
        
        RXApiService.request(config: config, type: CategoriesContent.self, success: { (contract) in
            _ = try! categoriesManager.save(contract.data)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        nextLaunchStage()
    }
}
