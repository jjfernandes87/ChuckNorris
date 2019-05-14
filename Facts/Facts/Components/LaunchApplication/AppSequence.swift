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
        nextLaunchStage()
    }
    
    func downloadCategories() {
        let categoriesManager = CategoriesCoreDataModel()
        let config = RequestService.request(tag: URLEndpoints.categories.rawValue)
        
        ApiService.request(config: config, success: { (statusCode, response) in
            guard let contract = JSONDecoder.decode(CategoriesContent.self, from: response) else { return }
            do {
                _ = try categoriesManager.save(contract.data)
            } catch {
                print(error.localizedDescription)
            }
        }) { (statusCode, error) in
            print(error.localizedDescription)
        }
        
        nextLaunchStage()
    }
}
