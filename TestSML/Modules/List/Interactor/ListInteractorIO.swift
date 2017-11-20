//
//  ListInteractorIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

// MARK: - Interactor Input
protocol ListInteractorInput {
    func getListItems()
}

// MARK: - Interactor Output
protocol ListInteractorOutput: class {
    func listItemsFetched(_ list: [ListItem])
}
