//
//  SettingItemService.swift
//  TestSML
//
//  Created by Юрий on 18.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation

protocol SettingItemService: class {
    func getFilledItems(handler: @escaping ([ListItem]) -> Void)
    func updateItem(item: ListItem)
}

final class SettingItemServiceImp {
    let itemStorage: ItemStorage
    
    init(storage: ItemStorage) {
        self.itemStorage = storage
    }
}

extension SettingItemServiceImp: SettingItemService {
    func getFilledItems(handler: @escaping ([ListItem]) -> Void) {
        let filledItems = itemStorage.getFilledItems().map { $0.simpleValue() }
        handler(filledItems)
    }
    
    func updateItem(item: ListItem) {
        let itemRealm = ListItemRealm()
        itemRealm.indexItem = item.indexItem
        itemRealm.pathFill = item.pathFill
        _ = itemStorage.save(itemRealm)
    }
}
