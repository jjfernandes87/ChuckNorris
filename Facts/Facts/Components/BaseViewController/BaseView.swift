//
//  BaseView.swift
//  Facts
//
//  Created by Julio Fernandes on 05/05/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import SelfTableViewManager

var preloadedLoadingXib: UINib!
var preloadedNoContentXib: UINib!

enum BaseStatus: Int {
    case unknown
    case loading
    case noContent
    case presenting
}

class BaseView: UIViewController {
    
    internal var status: BaseStatus?
    
    @IBOutlet weak var noContentXib: UIView?
    @IBOutlet weak var loadingXib: UIView?
    @IBOutlet weak var tableView: SelfTableViewManager!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScreens()
        self.view.backgroundColor = .white
    }
    
    func setViewStatus(_ status: BaseStatus, animated: Bool = true) {
        
        self.status = status
        
        if animated {
            UIView.beginAnimations("BaseStatus", context: nil)
        }
        
        self.hiddenAll()
        
        if status == .loading {
            if let customView = loadingXib {
                spinner.startAnimating()
                customView.alpha = 1.0
                customView.backgroundColor = view.backgroundColor
                view.bringSubview(toFront: customView)
            }
        }
        
        if status == .noContent {
            if let customView = noContentXib {
                customView.alpha = 1.0
                customView.backgroundColor = view.backgroundColor
                view.bringSubview(toFront: customView)
            }
        }
        
        if status == .presenting {
            self.showPresenting()
        }
        
        if(animated) {
            UIView.commitAnimations()
        }
        
    }
    
    func showPresenting() {
        spinner.stopAnimating()
    }
    
    private func setupScreens() {
        var statusViews = [UIView]()
        
        preloadedLoadingXib.instantiate(withOwner: self, options: nil)
        if let loading = loadingXib {
            statusViews.append(loading)
        }
        
        preloadedNoContentXib.instantiate(withOwner: self, options: nil)
        if let error = noContentXib {
            statusViews.append(error)
        }
        
        for statusView in statusViews {
            if statusView.superview == nil {
                self.view.addSubview(statusView)
                statusView.frame = self.view.frame
                statusView.clipsToBounds = true
                statusView.alpha = 0.0
                statusView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                statusView.setNeedsDisplay()
            }
        }
    }
    
    private func hiddenAll() {
        self.loadingXib?.alpha = 0
        self.noContentXib?.alpha = 0
    }
}
