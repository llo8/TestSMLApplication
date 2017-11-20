//
//  ListInteractor.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

/// Encapsulates List usecase business logic.
/// It is preferred to inject needed services in constructor
class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?

    // MARK: Services
    let listItemService: ListItemService

    init(service: ListItemService) {
        self.listItemService = service
	}
    
    func getListItems() {
        listItemService.getAllItems { [weak self] (items) in
            self?.output?.listItemsFetched(items)
        }
    }
    
}
