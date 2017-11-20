//
//  ServicesAssembly.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import DiKit

final class ServicesAssembly: BaseServiceAssembly {
    override init(withCollaborator collaborator: RootServicesAssembly) {
        super.init(withCollaborator: collaborator)
        container.register(.eagerSingleton) { ListItemServiceImp(storage: $0) as ListItemService }
        container.register(.eagerSingleton) { SettingItemServiceImp(storage: $0) as SettingItemService}
        bootstrap()
    }
}
