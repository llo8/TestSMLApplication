//
//  SettingsPresenter.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

/// Binds Settings usecase UI to business logic and manages transition logic between modules.
class SettingsPresenter {
    weak var view: SettingsViewInput?
    let interactor: SettingsInteractorInput
    let router: SettingsRouterInput

    init(interactor: SettingsInteractorInput, router: SettingsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Module Input
extension SettingsPresenter: SettingsModuleInput {
    
}

// MARK: - View Output
extension SettingsPresenter: SettingsViewOutput {    
    func viewIsReady() {
        view?.setupInitialState()
    }

    func viewAppearing() {
        interactor.fetchFilledItems()
    }
    
    func didTapCreateButton(rowS: String, pathFillS: String) {
        
        if rowS.isEmpty || pathFillS.isEmpty {
            return
        }
        
        let row = Int(rowS) ?? -1
        let pathFill = Double(pathFillS) ?? -1
        
        if row >= 0 && pathFill >= 0 && pathFill <= 1 {
            interactor.saveItem(ListItem(indexItem:row, pathFill:pathFill))
            interactor.fetchFilledItems()
        } else {
            view?.showWarningAlert()
        }
    }
}

// MARK: - Interactor Output
extension SettingsPresenter: SettingsInteractorOutput {
    func getFilledItems(items: [ListItem]) {
        view?.setFilledItems(list: items)
    }
}
