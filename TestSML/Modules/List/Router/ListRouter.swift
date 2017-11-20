//
//  ListRouter.swift
//  TestSML
//
//  Created by Yuriy Aliev on 15/11/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import ViperKit

class ListRouter: ListRouterInput {
    weak var transitionHandler: TransitionHandler?
    
    func showDetails(item: ListItem, button: UIButton) {
        transitionHandler?.openModule(segueIdentifier: "details") { moduleInput in
            guard let module = moduleInput as? DetailsModuleInput else { return }
            module.set(button: button)
            module.set(item: item)
        }
    }
    
    func showSettings() {
        transitionHandler?.openModule(segueIdentifier: "settings")
    }
}

