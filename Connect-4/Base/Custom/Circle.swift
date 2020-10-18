//
//  Circle.swift
//  Tic-Tac-Toe
//
//  Created by Meitar Basson on 18/10/2020.
//

import UIKit

class Circle: UIView {
    
    private var radius: CGFloat?
    private var color: UIColor?
    
    private var xLoction: Int?
    private var yLocation: Int?
    
    init(frame: CGRect, color: UIColor, radius: CGFloat) {
        super.init(frame: frame)
        self.color = color
        self.radius = radius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircleLayer() {
        
    }
    
}
