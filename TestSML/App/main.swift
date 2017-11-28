//
//  main.swift
//  TestSML
//
//  Created by Юрий on 28.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import UIKit
import DipUtils

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
        to: UnsafeMutablePointer<Int8>.self,
        capacity: Int(CommandLine.argc)
    ),
    NSStringFromClass(Application.self),
    NSStringFromClass(AppDelegate.self)
)
