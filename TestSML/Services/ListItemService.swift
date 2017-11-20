//
//  ListItemService.swift
//  TestSML
//
//  Created by Юрий on 18.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation

protocol ListItemService: class {
    func getAllItems(handler: @escaping ([ListItem]) -> Void)
}

final class ListItemServiceImp {
    let itemStorage: ItemStorage
    
    init(storage: ItemStorage) {
        self.itemStorage = storage
    }
}

extension ListItemServiceImp: ListItemService {
    func getAllItems(handler: @escaping ([ListItem]) -> Void) {
        var items = itemStorage.getAll().map { $0.simpleValue() }
        
        if items.count == 0 {
            var newItems:[ListItemRealm] = []
            for i in 0..<100 {
                let item = ListItemRealm()
                item.indexItem = i
                item.pathFill = 0.0
                
                newItems.append(item)
            }

            items = itemStorage.save(newItems).map { $0.simpleValue() }
        }
        
        handler(items)
    }
}
