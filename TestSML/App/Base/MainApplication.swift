//
//  MainApplication.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import LaunchKit

class MainApplication: Application {
    
    override class var factory: AssembliesFactory {
        return MainAssembliesFactory()
    }

}
