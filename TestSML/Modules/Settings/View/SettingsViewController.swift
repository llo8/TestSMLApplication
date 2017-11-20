//
//  SettingsViewController.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class SettingsViewController: BaseViewController {
    var output: SettingsViewOutput!
    var moduleInput: ModuleInput!
    
    var filledItems: [ListItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rowTextField: UITextField!
    @IBOutlet weak var pathFillTextField: UITextField!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewAppearing()
    }
    
    // MARK: IBActions
    @IBAction func tapUpdateButton() {
        let rowText = rowTextField.text ?? ""
        let pathFillText = pathFillTextField.text ?? ""
        output.didTapCreateButton(rowS: rowText, pathFillS: pathFillText)
    }
    
}

// MARK: - View Input
extension SettingsViewController: SettingsViewInput {
    func setupInitialState() {
        //customize UI and init controller values
        setupTableView()
    }
    
    func setFilledItems(list: [ListItem]) {
        self.filledItems = list
    }
    
    func showWarningAlert() {
        showError(error: " Некорректные данные ")
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func setupTableView() {
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "FilledCell")
        tableView.register(UINib.init(nibName: "ItemTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "FilledCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filledItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilledCell", for: indexPath) as! ItemTableViewCell
        
        cell.setup(filledItems[indexPath.row])
        cell.accessoryType = .none
        
        return cell
    }
}

// MARK: - Module Input
extension SettingsViewController: ModuleInputProvider {}
