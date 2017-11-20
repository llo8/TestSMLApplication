//
//  DetailsModuleAssembly.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import DiKit
import Dip_UI
import ViperKit

// TODO: copy to AssembliesFactory
// container.register(.eagerSingleton) { DetailsModuleAssembly(withCollaborator: $0) }
class DetailsModuleAssembly: BaseViperAssembly {
    let tag: String? = nil

    override init(withCollaborator collaborator: RootViperAssembly) {
        super.init(withCollaborator: collaborator)
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
