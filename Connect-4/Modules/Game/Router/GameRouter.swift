//
//  GameRouter.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

protocol GameRouterProtocol {
    var view: UIViewController? { get set }
    func gameFinished(player: Player, controller: GameViewController)
}

class GameRouter: GameRouterProtocol {
    weak var view: UIViewController?
    
    func gameFinished(player: Player, controller: GameViewController) {
        let gameFinishedController = GameFinishedAssembly.assemble(winningPlayer: player, controller: controller )
        view?.present(gameFinishedController, animated: true, completion: nil)
    }
}
