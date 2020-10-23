//
//  GameFinishedAssembly.swift
//  Connect-4
//
//  Created by Meitar Basson on 24/10/2020.
//

import UIKit

class GameFinishedAssembly {
    static func assemble(winningPlayer: Player, controller: GameViewController) -> UIViewController {
        let view = GameFinishedViewController()
        view.winningPlayer = winningPlayer
        view.delegate = controller
        
        return view
    }
}
