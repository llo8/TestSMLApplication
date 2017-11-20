//
//  MainAssembliesFactory.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import LaunchKit
import DiKit

class MainAssembliesFactory: AssembliesFactory {
    
    
    override func registerLaunchLayer(root: RootLaunchAssembly) {
        
        container.register(.eagerSingleton) { AppDelegatesAssembly(root: $0, storyboards: $1) }
        
    }
    
    override func registerPresentationLayer(root: RootViperAssembly) {
        
        container.register(.eagerSingleton) { ListModuleAssembly(withCollaborator: $0) }
        container.register(.eagerSingleton) { DetailsModuleAssembly(withCollaborator: $0) }
        container.register(.eagerSingleton) { SettingsModuleAssembly(withCollaborator: $0) }
        
    }
    
    override func registerServicesLayer(root: RootServicesAssembly) {
        
        container.register(.eagerSingleton) { ServicesAssembly(withCollaborator: $0) }
        
    }
    
    override func registerCoreLayer(root: RootCoreAssembly) {
        
        container.register(.eagerSingleton) { StoryboardsAssembly(withRoot: $0, systemInfrastructure: $1) }
        container.register(.eagerSingleton) { SystemInfrastructureAssembly(withRoot: $0) }
        
        container.register(.eagerSingleton) { StoragesAssembly(withRoot: $0) }
        
    }

}
