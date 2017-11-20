//
//  ListRouterInput.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation
import UIKit

protocol ListRouterInput {
    func showDetails(item: ListItem, button: UIButton)
    func showSettings()
}
