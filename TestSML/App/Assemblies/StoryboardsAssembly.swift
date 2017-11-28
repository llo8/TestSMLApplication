//
//  StoryboardsAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation
import DipUtils
import Dip

final class StoryboardsAssembly: DipAssembly {
    
    let storyboardTag = "Main"
    
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        
        container.register(.eagerSingleton) { Bundle.main }
        container.register(.singleton, tag: storyboardTag) { UIStoryboard(name: self.storyboardTag, bundle: $0) }
    }
}
