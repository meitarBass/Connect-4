//
//  Player.swift
//  Connect-4
//
//  Created by Meitar Basson on 22/10/2020.
//

import UIKit

struct Player {
    
    var type: PlayerType?
    var color: UIColor?
    
    mutating func getColor() {
        guard let type = type else { return }
        switch type {
        
        case .computer:
            self.color = UIColor.red
        case .human:
            self.color = UIColor.blue
        }
    }
}

enum PlayerType {
    case computer
    case human
}
