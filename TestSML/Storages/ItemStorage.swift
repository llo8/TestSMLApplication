//
//  ItemStorage.swift
//  TestSML
//
//  Created by Юрий on 17.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import Foundation
import RealmSwift

protocol ItemStorage {
    func getAll() -> [ListItemRealm]
    
    func getFilledItems() -> [ListItemRealm]
    
    func save(_ objects:[ListItemRealm]) -> [ListItemRealm]
    
    func save(_ item: ListItemRealm) -> ListItemRealm
}

final class ItemStorageRealm: ItemStorage, RealmGetAll, RealmGetWithPredicate, RealmSaveOne, RealmSaveMany {
    typealias Entity = ListItemRealm
    
    func getFilledItems() -> [ListItemRealm] {
        let predicate = NSPredicate(format:"pathFill > 0")
        return self.getEntity(predicate: predicate)
    }
    
}
