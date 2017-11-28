//
//  SettingsModuleAssembly.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import Dip
import Dip_UI
import DipUtils
import ViperKit

class SettingsModuleAssembly: ModuleDipAssembly {
    let tag: String? = nil
    
    required init() {}
    
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        unowned let service = assembliesProvider.container(of: ServicesAssembly.self)
        
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
        container.register { SettingsInteractor(service: try service.resolve()) }
            .implements(SettingsInteractorInput.self)
            .resolvingProperties { (container, interactor) in
                interactor.output = try container.resolve()
        }
    }
}

extension SettingsViewController: StoryboardInstantiatable {}
