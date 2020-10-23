//
//  GamePresenterProtocols.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

// View to Presenter
protocol GamePresenterProtocol: class {
    func resetBoard()
    func handleBoardTap(atX x: Float, atY y: Float)
    func viewDidLoad()
    
    var boardStats: BoardSizes? { get set }
    var controller: GameViewController? { get set }
}

// Interactor to Presenter
protocol GamePresenterInput: class {
    func addedCoinSuccessfuly(atX x: Float, atY y: Float, board: [[Circle]],
                              coinIndex: (x: Int, y :Int))
    func playerWon(winningPlayer: Player?)
}

// Manager to Presenter
protocol GameManagerDelegate: class {}
