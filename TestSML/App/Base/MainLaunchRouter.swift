//
//  MainLaunchRouter.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import UIKit

class MainLaunchRouter: LaunchRouter {
    let window: UIWindow
    let storyboard: UIStoryboard
    
    init(window: UIWindow, storyboard: UIStoryboard) {
        self.window = window
        self.storyboard = storyboard
    }
    
    func openInitialModule() {
        let controller = storyboard.instantiateInitialViewController()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
