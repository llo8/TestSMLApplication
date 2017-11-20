//
//  DetailsViewIO.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import ViperKit

protocol DetailsViewInput: class, ViewInput {

    /// Setup initial state of the view
    func setupInitialState()
    
    func setTitleItem(title: String)
    
    func set(button: UIButton)
}

protocol DetailsViewOutput {

    /// Notify presenter that view is ready
    func viewIsReady()
}
