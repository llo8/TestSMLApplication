//
//  DetailsModuleAssembly.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import DipUtils
import Dip_UI
import Dip
import ViperKit

class DetailsModuleAssembly: ModuleDipAssembly {
    let tag: String? = nil
    
    required init() {}
    
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        container.register(tag: nil) { DetailsViewController() }
            .implements(DetailsViewInput.self, TransitionHandler.self)
            .resolvingProperties { (container, controller) in
                controller.output = try container.resolve()
                controller.moduleInput = try container.resolve() as DetailsModuleInput
        }
        container.register { DetailsPresenter(interactor: $0, router: $1) }
            .implements(DetailsModuleInput.self, DetailsViewOutput.self, DetailsInteractorOutput.self)
            .resolvingProperties { [unowned self] (container, presenter) in
                presenter.view = try container.resolve(tag: self.tag)
        }
        container.register { DetailsRouter() }
            .implements(DetailsRouterInput.self)
            .resolvingProperties { [unowned self] (container, router) in
                router.transitionHandler = try container.resolve(tag: self.tag)
        }
        container.register { DetailsInteractor() }
            .implements(DetailsInteractorInput.self)
            .resolvingProperties { (container, interactor) in
                interactor.output = try container.resolve()
        }
    }

}

extension DetailsViewController: StoryboardInstantiatable {}
