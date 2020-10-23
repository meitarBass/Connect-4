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
            self.color = #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1)
        case .human:
            self.color = #colorLiteral(red: 0, green: 0.4274509804, blue: 0.9411764706, alpha: 1)
        }
    }
}

enum PlayerType {
    case computer
    case human
}
