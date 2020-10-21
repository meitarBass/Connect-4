//
//  GameBoardPresenterProtocols.swift
//  Connect-4
//
//  Created by Meitar Basson on 21/10/2020.
//

// View to Presenter
protocol GameBoardPresenterProtocol: class {
    func boardDidLoad()
    func resetBoard()
}

// Interactor to Presenter
protocol GameBoardPresenterInput: class {
    
}

// Manager to Presenter
protocol GameBoardManagerDelegate: class {}
