//
//  StoryboardsAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DiKit

final class StoryboardsAssembly: BaseCoreAssembly {
    let storyboardTag = "Main"
    
    var initialStoryboard: UIStoryboard {
        return resolve(tag: storyboardTag)
    }

    init(withRoot root: RootCoreAssembly, systemInfrastructure: SystemInfrastructureAssembly) {
        super.init(withRoot: root)
        container.register(.singleton, tag: storyboardTag) { UIStoryboard(name: self.storyboardTag, bundle: $0) }
        bootstrap()
    }
}
