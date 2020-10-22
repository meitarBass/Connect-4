//
//  GamePresenter.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

class GamePresenter {
    
    weak var view: GameViewInput?
    var interactor: GameInteractorInput?
    var router: GameRouterProtocol?
    
    var boardStats: BoardSizes?
    
    private var board: [[Circle]] = [[Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle]()]
    
    private var player = Player(type: .human, color: .blue)
}

// View to Presenter
extension GamePresenter: GamePresenterProtocol {
    
    func resetBoard() {
        let newBoard = [[Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle]()]
        self.board = newBoard
    }
    
    func handleBoardTap(atX x: Float, atY y: Float) {
        guard let boardStats = boardStats else { return }
        interactor?.tryAddNewCoin(atX: x, boardState: board, boardStats: boardStats, player: player)
    }
}

// Interactor to Presenter
extension GamePresenter: GamePresenterInput {
    func addedCoinSuccessfuly(atX x: Float, atY y: Float, board: [[Circle]]) {
        guard let size = boardStats?.circleWidthHeight else { return }
        let frame = (x, y, Float(size), Float(size))
        self.board = board
    
        guard let playerType = player.type, let color = player.color else { return }
        view?.addNewCoin(frame: frame, color: color)
        
        switch playerType {
        case .computer:
            player.type = .human
        case .human:
            player.type = .computer
        }
        player.getColor()
    }
    
    func someoneWon(winningPlayer: Player?) {
        // MARK: Navigate to new VC and announce winner
        guard let player = winningPlayer else { return }
        router?.gameFinished(player: player)
    }
}

extension GamePresenter: GameManagerDelegate {
    
}
