//
//  DetailsModuleInput.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import ViperKit

protocol DetailsModuleInput: class, ModuleInput {
    func set(button: UIButton)
    func set(item: ListItem)
}
