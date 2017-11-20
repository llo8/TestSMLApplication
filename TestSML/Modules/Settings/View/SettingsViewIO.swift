//
//  SettingsViewIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import ViperKit

protocol SettingsViewInput: class, ViewInput {

    /// Setup initial state of the view
    func setupInitialState()
    
    func setFilledItems(list: [ListItem])
    
    func showWarningAlert()
}

protocol SettingsViewOutput {

    /// Notify presenter that view is ready
    func viewIsReady()

    /// Notify presenter that view is about to appear on screen
    func viewAppearing()
    
    func didTapCreateButton(rowS: String, pathFillS: String)
}
