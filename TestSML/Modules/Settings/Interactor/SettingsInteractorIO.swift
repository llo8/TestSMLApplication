//
//  SettingsInteractorIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

// MARK: - Interactor Input
protocol SettingsInteractorInput {
    func fetchFilledItems()
    func saveItem(_ item: ListItem)
}

// MARK: - Interactor Output
protocol SettingsInteractorOutput: class {
    func getFilledItems(items: [ListItem])
}
