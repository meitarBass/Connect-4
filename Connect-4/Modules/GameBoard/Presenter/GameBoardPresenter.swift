//
//  GameBoardPresenter.swift
//  Connect-4
//
//  Created by Meitar Basson on 21/10/2020.
//

import UIKit

class GameBoardPresenter {
    weak var view: GameBoardViewInput?
//    var interactor: GameBoardInteractorInput?
//    var router: GameBoardRouterProtocol?
    
}

// View to Presenter
extension GameBoardPresenter: GameBoardPresenterProtocol {
    func boardDidLoad() {
        
    }

    func resetBoard() {
        
    }
}

// Interactor to Presenter
extension GameBoardPresenter: GameBoardPresenterInput {
    
}

extension GameBoardPresenter: GameBoardManagerDelegate {
    
}
