//
//  ListItem.swift
//  TestSML
//
//  Created by Юрий on 16.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

struct ListItem {
    var indexItem = 0
    var pathFill = 0.0
}

import Realm
import RealmSwift

class ListItemRealm: BaseRealmObject {
    @objc dynamic var indexItem: Int = 0
    @objc dynamic var pathFill: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "indexItem"
    }
    
    func simpleValue() -> ListItem {
        return ListItem(indexItem: indexItem, pathFill:pathFill)
    }
    
}


