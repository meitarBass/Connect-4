//
//  GameViewInput.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

// Presenter to View
protocol GameViewInput: class {
    func addNewCoin(frame: (x: Float, y: Float, width: Float, height: Float), color: UIColor)
    func switchPlayingPlayer(activePlayer: Player)
}

// GameFinished to View
protocol GameViewInputGF: class {
    func resetBoard()
}
