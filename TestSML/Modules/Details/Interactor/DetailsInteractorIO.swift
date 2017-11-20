//
//  DetailsInteractorIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

// MARK: - Interactor Input
protocol DetailsInteractorInput {

}

// MARK: - Interactor Output
protocol DetailsInteractorOutput: class {
	func encounteredError(error: Error)
}
