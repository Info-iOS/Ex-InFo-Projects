//
//  Coordiantor.swift
//  MoveScreen+Coordinator
//
//  Created by 박준하 on 2023/03/18.
//

import Foundation

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
