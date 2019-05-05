//
//  SharedContent.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class SharedContent {
    
    private static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    class func sharedContent(urlShare: URL, title: String, message: String) {
        guard let controller = appDelegate.mainRouter?.topViewController else { return }
        SharedContent.sharedContent(url: urlShare, title: title, message: message, controller: controller)
    }
    
    class func sharedContent(url: URL, title: String, message: String, controller: UIViewController) {
        let objectsToShare = [url, message] as [Any]
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        switch (deviceIdiom) {
        case .pad:
            if let popover = activity.popoverPresentationController {
                popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                popover.sourceView = controller.view
                popover.sourceRect = CGRect(x: controller.view.center.x, y:controller.view.center.y, width:0, height:0)
                controller.present(activity, animated: true, completion: nil)
            }
        case .phone:
            controller.present(activity, animated: true, completion: nil)
        default: break
        }
    }
}
