//
//  ListPresenter.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

/// Binds List usecase UI to business logic and manages transition logic between modules.
class ListPresenter {
    weak var view: ListViewInput?
    let interactor: ListInteractorInput
    let router: ListRouterInput

    init(interactor: ListInteractorInput, router: ListRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Module Input
extension ListPresenter: ListModuleInput {
    
}

// MARK: - View Output
extension ListPresenter: ListViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func viewAppearing() {
        interactor.getListItems()
    }
    
    func openSettings() {
        router.showSettings()
    }
    
    func didSelect(item: ListItem, button: UIButton) {
        router.showDetails(item: item, button: button)
    }
}

// MARK: - Interactor Output
extension ListPresenter: ListInteractorOutput {
    func listItemsFetched(_ list: [ListItem]) {
        view?.setItems(list)
    }
}
