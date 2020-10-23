//
//  GameInteractorInput.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

protocol GameInteractorInput {
    func tryAddNewCoin(atX x: Float, boardState: [[Circle]], boardStats: BoardSizes, player: Player)
    func checkIfSomeoneWon(board: [[Circle]], lastCoinIndex: (x: Int, y: Int), player: Player)
}
