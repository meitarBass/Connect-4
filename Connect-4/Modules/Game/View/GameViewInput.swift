//
//  GameViewInput.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

// Presenter to View
protocol GameViewInput: class {
    func addNewCoin(frame: (x: Float, y: Float, width: Float, height: Float))
    func resetBoard()
}
