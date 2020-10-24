//
//  GamePresenter.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

class GamePresenter {
    
    weak var view: GameViewInput?
    weak var controller: GameViewController?
    
    var interactor: GameInteractorInput?
    var router: GameRouterProtocol?
    
    var boardStats: BoardSizes?
    
    private var board: [[Circle]] = [[Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle](), [Circle]()]
    
    private var player = Player(type: .human, color: #colorLiteral(red: 0, green: 0.4274509804, blue: 0.9411764706, alpha: 1))
}

// View to Presenter
extension GamePresenter: GamePresenterProtocol {
    
    func viewDidLoad() {
        resetBoard()
    }
    
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
    func addedCoinSuccessfuly(atX x: Float, atY y: Float, board: [[Circle]],
                              coinIndex: (x: Int, y: Int)) {
        guard let size = boardStats?.circleWidthHeight else { return }
        let frame = (x, y, Float(size), Float(size))
        self.board = board
    
        guard let playerType = player.type, let color = player.color else { return }
        view?.addNewCoin(frame: frame, color: color)
        
        interactor?.checkIfSomeoneWon(board: board, lastCoinIndex: coinIndex, player: player)
        
        switch playerType {
        case .computer:
            player.type = .human
        case .human:
            player.type = .computer
        }
        player.getColor()
        
        view?.switchPlayingPlayer(activePlayer: player)
    }
    
    func playerWon(winningPlayer: Player?) {
        // MARK: Navigate to new VC and announce winner
        guard let player = winningPlayer, let controller = controller else { return }
        router?.gameFinished(player: player, controller: controller)
    }
}

extension GamePresenter: GameManagerDelegate {
    
}
