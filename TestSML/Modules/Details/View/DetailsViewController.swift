//
//  DetailsViewController.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class DetailsViewController: BaseViewController {
    var output: DetailsViewOutput!
    var moduleInput: ModuleInput!

    // MARK: Outlets
    @IBOutlet weak var titleItem: UILabel!
    var prevSuperviewButton: UIView?
    var button: UIButton?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        prevSuperviewButton?.addSubview(button!)
    }
}

// MARK: - View Input
extension DetailsViewController: DetailsViewInput {
    func setupInitialState() {
        //customize UI and init controller values
        prevSuperviewButton = button?.superview
        titleItem.superview?.addSubview(button!)
    }
    
    func setTitleItem(title: String) {
        titleItem.text = title
    }
    
    func set(button: UIButton) {
        self.button = button
    }
}

// MARK: - Module Input
extension DetailsViewController: ModuleInputProvider {}
