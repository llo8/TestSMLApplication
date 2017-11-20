//
//  AppDelegate.swift
//  TestSML
//
//  Created by Юрий on 15.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import UIKit
import LaunchKit

class AppDelegate: UIResponder, AppDelegateHandler {
    let mainRouter: LaunchRouter
    
    init(mainRouter: LaunchRouter) {
        self.mainRouter = mainRouter
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        mainRouter.openInitialModule()
        
        return true
    }

}

