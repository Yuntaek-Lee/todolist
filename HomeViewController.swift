//
//  HomeViewController.swift
//  task management
//
//  Created by snlcom on 6/16/24.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SwiftUI 뷰를 포함
        let homeView = Home()
        let hostingController = UIHostingController(rootView: homeView)
        addChild(hostingController)
        hostingController.view.frame = self.view.bounds
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}

