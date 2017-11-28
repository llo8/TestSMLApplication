//
//  StoragesAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DipUtils
import Dip

final class StoragesAssembly: DipAssembly {
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        
        container.register(.singleton) { ItemStorageRealm() as ItemStorage }
    }
}
