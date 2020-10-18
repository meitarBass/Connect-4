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
    
}

// View to Presenter
extension GamePresenter: GamePresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func resetBoard() {
        
    }
}

// Interactor to Presenter
extension GamePresenter: GamePresenterInput {
    
}

extension GamePresenter: GameManagerDelegate {
    
}
