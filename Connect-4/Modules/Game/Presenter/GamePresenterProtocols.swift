//
//  GamePresenterProtocols.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

// View to Presenter
protocol GamePresenterProtocol: class {
    func viewDidLoad()
    func resetBoard()
    func handleBoardTap(atX x: Float, atY y: Float)
    
    var boardStats: BoardSizes? { get set }
}

// Interactor to Presenter
protocol GamePresenterInput: class {
    func addedCoinSuccessfuly(atX x: Float, atY y: Float, board: [[Circle]])
}

// Manager to Presenter
protocol GameManagerDelegate: class {}
