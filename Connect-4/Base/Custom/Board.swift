//
//  Board.swift
//  Connect-4
//
//  Created by Meitar Basson on 20/10/2020.
//

import UIKit
import SnapKit

struct BoardSizes {
    var circlesGap: CGFloat?
    var leftRightGap: CGFloat?
    var topBottomGap: CGFloat?
    var circleWidthHeight: CGFloat?
    var imageGapTopBottom: CGFloat?
    
    let imageGapSides: CGFloat = 16.0
}

extension Board {
    struct Appearance {
        let circleGapToCircleWidthRatio: CGFloat = 10 / 70
        let leftRightGapToCircleWidthRation: CGFloat = 12 / 70
        let topBottomGapToCircleWidthRation: CGFloat = 15 / 70
    }
}

protocol BoardProtocol {
    func calculateCircleWidthHeight()
    func calculateLeftRightGap()
    func calculateBetweenCirclesGap()
    func calculateTopBottomGap()
}

class Board: UIImageView {

    var boardSizes = BoardSizes()
    let appearance = Appearance()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "gameBoard")
        self.contentMode = .scaleAspectFit
        self.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Board: BoardProtocol {
    func calculateCircleWidthHeight() {
        let imgFrameWidth = self.frame.width
        self.boardSizes.circleWidthHeight = imgFrameWidth / ( 7 + 6 * appearance.circleGapToCircleWidthRatio + 2 * appearance.leftRightGapToCircleWidthRation)
        
        self.calculateBetweenCirclesGap()
        self.calculateTopBottomGap()
        self.calculateLeftRightGap()
        self.calculateImageTopBottomGap()
    }
    
    func calculateBetweenCirclesGap() {
        guard let circleWidth = self.boardSizes.circleWidthHeight else { return }
        self.boardSizes.circlesGap = circleWidth * appearance.circleGapToCircleWidthRatio
    }
    
    func calculateTopBottomGap() {
        guard let circleWidth = self.boardSizes.circleWidthHeight,
              let circleGap = self.boardSizes.circlesGap
        else { return }
        let imgFrameHeight = self.frame.height
        self.boardSizes.topBottomGap = (imgFrameHeight - (6 * circleWidth + 5 * circleGap)) / 2
    }
    
    func calculateLeftRightGap() {
        guard let circleWidth = self.boardSizes.circleWidthHeight else { return }
        self.boardSizes.leftRightGap = circleWidth * appearance.leftRightGapToCircleWidthRation
    }
    
    func calculateImageTopBottomGap() {
        let imgFrameHeight = self.frame.height
        self.boardSizes.imageGapTopBottom = (UIScreen.main.bounds.height + imgFrameHeight) / 2 
    }
}
