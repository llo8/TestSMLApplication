//
//  ListModuleAssembly.swift
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

class ListModuleAssembly: ModuleDipAssembly {
    let tag: String? = nil
   
    required init() {}
    
    func register(into container: DependencyContainer,
                  with assembliesProvider: AssembliesProvider) {
        
        unowned let service = assembliesProvider.container(of: ServicesAssembly.self)
        
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
        container.register { ListInteractor(service: try service.resolve()) }
            .implements(ListInteractorInput.self)
            .resolvingProperties { (container, interactor) in
                interactor.output = try container.resolve()
        }
    }
}

extension ListViewController: StoryboardInstantiatable {}
