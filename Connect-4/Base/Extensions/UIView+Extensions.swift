//
//  UIView+Extensions.swift
//  Connect-4
//
//  Created by Meitar Basson on 24/10/2020.
//

import UIKit

extension UIView {
    
    func addShadow(opacity: Float, radius: CGFloat, offset: CGSize, color: UIColor) {
        clipsToBounds = false
        
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.masksToBounds = false
    }
}
