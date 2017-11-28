//
//  AppDelegatesAssembly.swift
//  TestSML
//
//  Created by Юрий on 28.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation
import DipUtils
import Dip

final class AppDelegatesAssembly: DipAssembly {
    func register(into container: DependencyContainer, with assembliesProvider: AssembliesProvider) {
        container.register(.singleton) { AppDelegate() }
    }
}
