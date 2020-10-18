//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

class GameViewController: UIViewController {
    
    var presenter: GamePresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
    }


}

extension GameViewController: GameViewInput {
    
}
