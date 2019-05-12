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
    }
}

// MARK: - Launch methods
@objc extension AppSequence {
    func preloadedXib() {
        preloadedLoadingXib = UINib(nibName: "LoadingView", bundle: Bundle.main)
        preloadedNoContentXib = UINib(nibName: "NoContent", bundle: Bundle.main)
        nextLaunchStage()
    }
}
