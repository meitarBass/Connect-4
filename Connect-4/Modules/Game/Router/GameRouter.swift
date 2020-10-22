//
//  GameRouter.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

protocol GameRouterProtocol {
    var view: UIViewController? { get set }
    func gameFinished(player: Player)
}

class GameRouter: GameRouterProtocol {
    weak var view: UIViewController?
    
    func gameFinished(player: Player) {
//        let gameFinishedView = GameFinishedAssembly.assemble()
//        view?.navigationController?.pushViewController(gameFinishedView, animated: true)
    }
}
