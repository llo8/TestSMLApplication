//
//  main.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//


import LaunchKit

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(to: UnsafeMutablePointer<Int8>.self,
                    capacity: Int(CommandLine.argc)),
    NSStringFromClass(MainApplication.self),
    NSStringFromClass(AppDelegateProxy.self)
)
