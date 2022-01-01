//
//  Coordinator.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator? { get set }
}
