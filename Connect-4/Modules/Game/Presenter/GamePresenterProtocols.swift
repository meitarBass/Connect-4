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
}

// Interactor to Presenter
protocol GamePresenterInput: class {
    
}

// Manager to Presenter
protocol GameManagerDelegate: class {}
