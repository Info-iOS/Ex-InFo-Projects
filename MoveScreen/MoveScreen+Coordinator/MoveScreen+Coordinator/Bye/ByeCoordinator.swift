//
//  ByeCoordinator.swift
//  MoveScreen+Coordinator
//
//  Created by 박준하 on 2023/03/18.
//

import UIKit

protocol ByeCoordinatorDelegate {
    func tapBye(_ coordinator: ByeCoordinator)
}

class ByeCoordinator: Coordinator, ByeViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: ByeCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ByeViewController()
        viewController.view.backgroundColor = .white
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
    
    func bye() {
        self.delegate?.tapBye(self)
    }
}
