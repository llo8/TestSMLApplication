//
//  SettingsModuleAssembly.swift
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
// container.register(.eagerSingleton) { SettingsModuleAssembly(withCollaborator: $0) }
class SettingsModuleAssembly: BaseViperAssembly {
    let tag: String? = nil

    override init(withCollaborator collaborator: RootViperAssembly) {
        super.init(withCollaborator: collaborator)
        container.register(tag: nil) { SettingsViewController() }
            .implements(SettingsViewInput.self, TransitionHandler.self)
            .resolvingProperties { (container, controller) in
                controller.output = try container.resolve()
                controller.moduleInput = try container.resolve() as SettingsModuleInput
            }
        container.register { SettingsPresenter(interactor: $0, router: $1) }
            .implements(SettingsModuleInput.self, SettingsViewOutput.self, SettingsInteractorOutput.self)
            .resolvingProperties { [unowned self] (container, presenter) in
                presenter.view = try container.resolve(tag: self.tag)
            }
        container.register { SettingsRouter() }
            .implements(SettingsRouterInput.self)
            .resolvingProperties { [unowned self] (container, router) in
                router.transitionHandler = try container.resolve(tag: self.tag)
            }
        container.register { SettingsInteractor(service: $0) }
            .implements(SettingsInteractorInput.self)
            .resolvingProperties { (container, interactor) in
                interactor.output = try container.resolve()
            }
    }
}

extension SettingsViewController: StoryboardInstantiatable {}
