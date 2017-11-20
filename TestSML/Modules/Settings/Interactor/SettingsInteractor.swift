//
//  SettingsInteractor.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

/// Encapsulates Settings usecase business logic.
/// It is preferred to inject needed services in constructor
class SettingsInteractor: SettingsInteractorInput {
    weak var output: SettingsInteractorOutput?

    // MARK: Services
    let settingItemService: SettingItemService

    init(service: SettingItemService) {
        self.settingItemService = service
	}
    
    func fetchFilledItems() {
        settingItemService.getFilledItems { [weak self] (list) in
            self?.output?.getFilledItems(items: list)
        }
    }
    
    func saveItem(_ item: ListItem) {
        settingItemService.updateItem(item: item)
    }
    
}
