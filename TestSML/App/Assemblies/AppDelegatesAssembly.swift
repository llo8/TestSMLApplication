//
//  AppDelegatesAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DiKit
import LaunchKit

final class AppDelegatesAssembly: BaseLaunchAssembly {
    var appDelegate: AppDelegate {
        return resolve()
    }
    
    init(root: RootLaunchAssembly, storyboards: StoryboardsAssembly) {
        super.init(withCollaborator: root)
        
        container.register { MainLaunchRouter(window: $0, storyboard: storyboards.initialStoryboard) as LaunchRouter }
        container.register { AppDelegate(mainRouter: $0) }
        container.register { AppDelegateProxy() }
            .resolvingProperties { (_, proxy) in
                proxy.handlers = [
                    self.appDelegate as AppDelegateHandler
                ]
        }
    }
}
