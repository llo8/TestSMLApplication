//
//  ListViewController.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class ListViewController: BaseTableViewController {
    var output: ListViewOutput!
    var moduleInput: ModuleInput!

    var list: [ListItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

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
    @IBAction func openSetting() {
        output.openSettings()
    }
    
    // MARK - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        
        cell.setup(list[indexPath.row])
        
        return cell
    }
    
    // MARK - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! ItemTableViewCell
        output.didSelect(item: list[indexPath.row], button: cell.indexButton)
    }
    
}

// MARK: - View Input
extension ListViewController: ListViewInput {    
    func setupInitialState() {
        //customize UI and init controller values
        let button =  UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(openSetting), for: .touchUpInside)
        self.navigationItem.titleView = button
        
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(UINib.init(nibName: "ItemTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "Cell")
    }
    
    func setItems(_ list: [ListItem]) {
        self.list = list
    }
}

// MARK: - Module Input
extension ListViewController: ModuleInputProvider {}
