//
//  AppCoordinator.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

protocol AppCoordinatorProtocol: class {
    func createHomePage(scene: UIWindowScene)
}

class AppCoordinator {
    var window: UIWindow?
}

// MARK: Home page case
extension AppCoordinator {
    
    private func createGraphsVC() -> UINavigationController {
        let homeVC = GameAssembly.assemble()
        return UINavigationController(rootViewController: homeVC)
    }
}

extension AppCoordinator: AppCoordinatorProtocol {
    

    func createHomePage(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createGraphsVC()
        window?.makeKeyAndVisible()
    }
}
