//
//  GameAssembly.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

class GameAssembly {
    static func assemble() -> UIViewController {
        let view = GameViewController()
        let presenter = GamePresenter()
        let interactor = GameInteractor()
        let router = GameRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
