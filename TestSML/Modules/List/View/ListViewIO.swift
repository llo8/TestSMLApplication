//
//  ListViewIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import ViperKit

protocol ListViewInput: class, ViewInput {

    /// Setup initial state of the view
    func setupInitialState()
    
    func setItems(_ list: [ListItem])
}

protocol ListViewOutput {

    /// Notify presenter that view is ready
    func viewIsReady()
    
    func viewAppearing()
    
    func openSettings()
    
    func didSelect(item: ListItem, button: UIButton)
    
}
