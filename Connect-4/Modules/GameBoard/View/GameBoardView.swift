//
//  GameBoardView.swift
//  Connect-4
//
//  Created by Meitar Basson on 21/10/2020.
//

import UIKit
import SnapKit

extension GameBoardView {
    struct Appearance {
        let circleGapToCircleWidthRatio: CGFloat = 10 / 70
        let leftRightGapToCircleWidthRation: CGFloat = 12 / 70
        let topBottomGapToCircleWidthRation: CGFloat = 15 / 70
    }
}

class GameBoardView: UIImageView {

    var circlesGap: CGFloat?
    var leftRightGap: CGFloat?
    var topBottomGap: CGFloat?
    var circleWidthHeight: CGFloat?
    
    let imageGap: CGFloat = 16.0
    let appearance = Appearance()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "gameBoard")
        self.contentMode = .scaleAspectFill
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameBoardView: GameBoardViewInput {
    func calculateCircleWidthHeight() {
        let imgFrameWidth = self.frame.width
        self.circleWidthHeight = imgFrameWidth / ( 7 + 6 * appearance.circleGapToCircleWidthRatio + 2 * appearance.leftRightGapToCircleWidthRation)
        
        self.calculateBetweenCirclesGap()
        self.calculateTopBottomGap()
        self.calculateLeftRightGap()
    }
    
    func calculateBetweenCirclesGap() {
        guard let circleWidth = circleWidthHeight else { return }
        self.circlesGap = circleWidth * appearance.circleGapToCircleWidthRatio
    }
    
    func calculateTopBottomGap() {
        guard let circleWidth = circleWidthHeight else { return }
        self.topBottomGap = circleWidth * appearance.topBottomGapToCircleWidthRation
    }
    
    func calculateLeftRightGap() {
        guard let circleWidth = circleWidthHeight else { return }
        self.leftRightGap = circleWidth * appearance.leftRightGapToCircleWidthRation
    }
}
