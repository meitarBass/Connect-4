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
    
    private var circlePath: CGPath?
    var circleLayer: CAShapeLayer?
    
    init(frame: CGRect, color: UIColor, radius: CGFloat) {
        super.init(frame: frame)
        self.radius = radius
        self.color = color
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        createCirclePath()
        circleLayer = createCircleLayer(midPoint: center)
        
        guard let circleLayer = self.circleLayer else { return }
        self.layer.addSublayer(circleLayer)
    }
    
    private func createCirclePath() {
        guard let radius = self.radius else { return }
        let path = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        path.usesEvenOddFillRule = true
        self.circlePath = path.cgPath
    }
    
    private func createCircleLayer(midPoint: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = self.circlePath
        layer.strokeColor = UIColor.clear.cgColor
        layer.fillColor = self.color?.cgColor ?? UIColor.white.cgColor
        layer.lineWidth = 5.0
        layer.lineCap = .round
        layer.position = midPoint
        layer.fillRule = .evenOdd
        return layer
    }
    
}
