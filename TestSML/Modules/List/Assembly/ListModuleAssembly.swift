//
//  ListModuleAssembly.swift
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
// container.register(.eagerSingleton) { ListModuleAssembly(withCollaborator: $0) }
class ListModuleAssembly: BaseViperAssembly {
    let tag: String? = nil

    override init(withCollaborator collaborator: RootViperAssembly) {
        super.init(withCollaborator: collaborator)
        container.register(tag: nil) { ListViewController() }
            .implements(ListViewInput.self, TransitionHandler.self)
            .resolvingProperties { (container, controller) in
                controller.output = try container.resolve()
                controller.moduleInput = try container.resolve() as ListModuleInput
            }
        container.register { ListPresenter(interactor: $0, router: $1) }
            .implements(ListModuleInput.self, ListViewOutput.self, ListInteractorOutput.self)
            .resolvingProperties { [unowned self] (container, presenter) in
                presenter.view = try container.resolve(tag: self.tag)
            }
        container.register { ListRouter() }
            .implements(ListRouterInput.self)
            .resolvingProperties { [unowned self] (container, router) in
                router.transitionHandler = try container.resolve(tag: self.tag)
            }
        container.register { ListInteractor(service: $0) }
            .implements(ListInteractorInput.self)
            .resolvingProperties { (container, interactor) in
                interactor.output = try container.resolve()
            }
    }
}

extension ListViewController: StoryboardInstantiatable {}
