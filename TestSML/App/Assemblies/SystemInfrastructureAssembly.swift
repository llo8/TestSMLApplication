//
//  SystemInfrastructureAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DiKit

final class SystemInfrastructureAssembly: BaseCoreAssembly {
    
    override init(withRoot collaborator: RootCoreAssembly) {
        super.init(withRoot: collaborator)
        container.register(.eagerSingleton) { UIWindow(frame: UIScreen.main.bounds) }
        container.register(.eagerSingleton) { Bundle.main }
    }
}
