//
//  Main+Coordinator.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

final class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToHomeView()
    }
        
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

// MARK: - Internal Navigation
extension MainCoordinator {
    func goToHomeView() {
        let view = HomeViewController()
        view.coordinator = self
        navigationController.pushViewController(view, animated: true)
    }
    
    func goToFilterView() {
        let view = FilterViewController()
        view.coordinator = self
        navigationController.pushViewController(view, animated: true)
    }
}

