//
//  DetailsPresenter.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

/// Binds Details usecase UI to business logic and manages transition logic between modules.
class DetailsPresenter {
    weak var view: DetailsViewInput?
    let interactor: DetailsInteractorInput
    let router: DetailsRouterInput
    
    var item: ListItem?

    init(interactor: DetailsInteractorInput, router: DetailsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Module Input
extension DetailsPresenter: DetailsModuleInput {
    func set(item: ListItem) {
        self.item = item
    }
    
    func set(button: UIButton) {
        view?.set(button: button)
    }
}

// MARK: - View Output
extension DetailsPresenter: DetailsViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
        view?.setTitleItem(title: "\(item?.indexItem ?? 0)")
    }
}

// MARK: - Interactor Output
extension DetailsPresenter: DetailsInteractorOutput {
    func encounteredError(error: Error) {
        
    }
}
