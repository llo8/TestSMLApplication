//
//  ServicesAssembly.swift
//  TestSML
//
//  Created by Юрий on 16A.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DipUtils
import Dip

final class ServicesAssembly: DipAssembly {
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        
        unowned let storage = assembliesProvider.container(of: StoragesAssembly.self)
        
        container.register(.eagerSingleton) { ListItemServiceImp(storage: try storage.resolve()) as ListItemService }
        container.register(.eagerSingleton) { SettingItemServiceImp(storage: try storage.resolve()) as SettingItemService}
    }
}
