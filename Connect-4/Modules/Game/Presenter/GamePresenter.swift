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
}

// View to Presenter
extension GamePresenter: GamePresenterProtocol {

    func viewDidLoad() {
        
    }
    
    func resetBoard() {
        
    }
    
    func handleBoardTap(atX x: Float, atY y: Float) {
        guard let boardStats = boardStats else { return }
        interactor?.tryAddNewCoin(atX: x, boardState: board, boardStats: boardStats)
    }
}

// Interactor to Presenter
extension GamePresenter: GamePresenterInput {
    func addedCoinSuccessfuly(atX x: Float, atY y: Float, board: [[Circle]]) {
        guard let size = boardStats?.circleWidthHeight else { return }
        let frame = (x, y, Float(size), Float(size))
        self.board = board
        view?.addNewCoin(frame: frame)
    }
}

extension GamePresenter: GameManagerDelegate {
    
}
